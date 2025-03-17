//
//  AttachmentService.swift
//  vapor-server
//
//  Created by Ed Hellyer on 3/16/25.
//

import Foundation
import Vapor

enum MultipartError: Error {
    case invalidHeader(String)
    case unableToWriteFile(String)
    case unableToCloseFileHandle(String)
}

protocol AttachmentServiceProtocol {
    
    /// Upload for creating a new Attachment instance.
    /// - Parameters:
    ///   - boundary: The multipart/form-data boundary definition.
    ///   - req: The request sent from the client
    /// - Returns: A new instance of the Attachment object.
    func uploadAttachment(using boundary: String, req: Request) async throws -> Attachment
}

struct AttachmentService: AttachmentServiceProtocol {
    
    func uploadAttachment(using boundary: String, req: Request) async throws -> Attachment {
        
        let appName = ProcessInfo.processInfo.processName
        let tempDirectory = FileManager.default.temporaryDirectory.appendingPathComponent(appName).appendingPathComponent("multiparts")
        do {
            try FileManager.default.createDirectoryIfNeeded(at: tempDirectory)
        } catch {
            throw Abort(.internalServerError, reason: "Unable to create temporary directory: \(error)")
        }
        
        let parser = MultipartParser(boundary: boundary)
        let limit: Int = 50_000_000 //50MB
        var currentBody: Data = Data()
        var currentHeaders: HTTPHeaders = [:]
        var fileHandle: FileHandle? = nil
        var filePath: URL? = nil
        var multipartError: MultipartError? = nil
        
        //Attachment properties
        var attachmentPath: URL! = nil
        var attachmentMimeType: MimeType! = nil
        var previewPath: URL? = nil
        var previewMimeType: MimeType? = nil
        var caption: String? = nil
        
        // Configure parser callbacks
        parser.onHeader = { name, value in
            guard multipartError == nil else { return }
            
            currentHeaders.replaceOrAdd(name: name.lowercased(), value: value)
            
            if name.lowercased() == "content-disposition",
               let fileName = self.value(forParameter: "filename", inHeaderValue: value) {
                do {
                    filePath = tempDirectory.appendingPathComponent(fileName)
                    if FileManager.default.fileExists(atPath: filePath!.path) {
                        try FileManager.default.removeItem(at: filePath!)
                    }
                    try FileManager.default.createFileIfNeeded(at: filePath!)
                    fileHandle = FileHandle(forWritingAtPath: filePath!.path)
                    fileHandle?.seekToEndOfFile()
                } catch {
                    multipartError = MultipartError.invalidHeader("Unable to create file handle: \(error)")
                }
            }
        }
        
        parser.onBody = { buffer in
            guard multipartError == nil else { return }
            
            do {
                if let fileHandle {
                    try fileHandle.write(contentsOf: buffer.readableBytesView)
                } else {
                    currentBody.append(contentsOf: buffer.readableBytesView)
                }
            } catch {
                multipartError = MultipartError.unableToWriteFile("Unable to write multiple part to file: \(error)")
            }
        }
        
        parser.onPartComplete = {
            guard multipartError == nil else { return }
            
            let part = MultipartPart(headers: currentHeaders, body: currentBody)
            
            if part.name == "caption" {
                caption = String(data: currentBody, encoding: .utf8)
            } else if part.name == "attachmentData",
                      let mimeTypeString = currentHeaders["content-type"].first {
                attachmentPath = filePath!
                attachmentMimeType = MimeType(rawValue: mimeTypeString)
            } else if part.name == "previewData",
                      let mimeTypeString = currentHeaders["content-type"].first {
                previewPath = filePath
                previewMimeType = MimeType(rawValue: mimeTypeString)
            }
            do {
                try fileHandle?.close()
            } catch {
                multipartError = MultipartError.unableToCloseFileHandle("Unable to close file handle: \(error)")
            }
            fileHandle = nil
            currentHeaders = [:]
            currentBody = Data()
        }
        
        //Handle incoming data from the body stream
        do {
            try await parser.execute(req.body.collect(upTo: limit))
        } catch {
            throw Abort(.badRequest, reason: error.localizedDescription)
        }
        
        if let multipartError {
            try? fileHandle?.close()
            if case MultipartError.invalidHeader(let message) = multipartError {
                throw Abort(.badRequest, reason: message)
            } else if case MultipartError.unableToCloseFileHandle(let message) = multipartError {
                throw Abort(.badRequest, reason: message)
            } else if case MultipartError.unableToWriteFile(let message) = multipartError {
                throw Abort(.badRequest, reason: message)
            }
            throw Abort(.badRequest, reason: "Unknown error occurred while parsing multipart form data.")
        }
        
        let attachment = Attachment(attachmentId: Int.random(in: 1...1000000), // Fake a new Id for now.
                                    attachmentUri: attachmentPath,
                                    attachmentMimeType: attachmentMimeType,
                                    previewUri: previewPath,
                                    previewMimeType: previewMimeType,
                                    caption: caption)
        
        return attachment
    }
    
    private func value(forParameter parameter: String, inHeaderValue value: String) -> String? {
        return value.split(separator: ";")
            .compactMap({ $0.trimmingCharacters(in: .whitespacesAndNewlines) })
            .first(where: { $0.starts(with: "\(parameter)=") })?
            .split(separator: "=")
            .last?
            .trimmingCharacters(in: ["\""])
    }
}
