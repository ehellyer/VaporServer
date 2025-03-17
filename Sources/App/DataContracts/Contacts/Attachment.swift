//
//  Attachment.swift
//  Membership
//
//  Created by Ed Hellyer on 9/1/24.
//

import Foundation
import Vapor

struct Attachment: Content {
    
    init(attachmentId: Int,
         attachmentUri: URL,
         attachmentMimeType: MimeType,
         previewUri: URL?,
         previewMimeType: MimeType? = nil,
         caption: String? = nil) {
        
        self.attachmentId = attachmentId
        self.attachmentUri = attachmentUri
        self.attachmentMimeType = attachmentMimeType
        self.previewUri = previewUri
        self.previewMimeType = previewMimeType
        self.caption = caption
    }
    
    /// Unique identifier for the source data of this attachment.
    var attachmentId: Int
    
    /// Gets the uniform resource locator for the attachment binary source.
    var attachmentUri: URL
    
    /// Identifies the binary type of the attachment by identifying its `MimeType`.
    var attachmentMimeType: MimeType
    
    /// Gets the uniform resource locator for the preview attachment, typically a thumbnail image.
    var previewUri: URL?

    /// Identifies the binary type of the attachment by identifying its `MimeType`.
    var previewMimeType: MimeType?

    /// Gets the optional caption for the attachment.
    var caption: String?
}

//MARK: - Attachment CustomStringConvertible extension
extension Attachment: CustomStringConvertible {
    var description: String {
"""
Attachment(
    attachmentId: \(attachmentId),
    attachmentUri: \"\(attachmentUri.description)\",    
    attachmentMimeType: \"\(attachmentMimeType.rawValue)\",
    previewUri: \"\(previewUri?.description ?? "null")\",
    previewMimeType: \"\(previewMimeType?.description ?? "null")\",
    caption: \"\(caption?.description ?? "null")\"  
)
"""
    }
}
