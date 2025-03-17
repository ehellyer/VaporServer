//
//  AttachmentController.swift
//  vapor-server
//
//  Created by Ed Hellyer on 12/28/24.
//

import Foundation
import Vapor

struct AttachmentController: RouteCollection {
    
    private var attachmentService: AttachmentServiceProtocol = AttachmentService()
    
    /// Initialize the routing for the AttachmentController
    /// - Parameter routes: Reference to the server route builder.
    func boot(routes: Vapor.RoutesBuilder) throws {
        let router = routes.grouped("api", "attachment")
        
        // POST /api/attachment/upload
        router.post("upload", use: uploadAttachment)
    }
    
    private func uploadAttachment(req: Request) async throws -> Attachment {
        
        // Prepare a boundary from the Content-Type header
        guard let boundary = req.headers.contentType?.parameters["boundary"] else {
            throw Abort(.badRequest, reason: "Boundary not found in Content-Type")
        }
        
        req.logger.info("Parsing multipart data...")
        let attachment = try await self.attachmentService.uploadAttachment(using: boundary, req: req)
        return attachment
    }
}
