//
//  MimeType.swift
//  vapor-server
//
//  Created by Ed Hellyer on 12/29/24.
//

import Foundation
import Vapor

/// Multipurpose Internet Mail Extension
///
/// Represents common `MimeType`'s and their associated file extensions.
enum MimeType: String, Content {
    
    // MARK: - Text Types
    
    /// Plain text file (e.g., `.txt`).
    case plainText = "text/plain"
    
    /// HTML file (e.g., `.html`).
    case html = "text/html"
    
    /// CSS file (e.g., `.css`).
    case css = "text/css"
    
    /// JavaScript file (e.g., `.js`).
    case javascript = "text/javascript"
    
    /// CSV file (e.g., `.csv`).
    case csv = "text/csv"
    
    /// JSON file (e.g., `.json`).
    case json = "application/json"
    
    /// XML file (e.g., `.xml`).
    case xml = "application/xml"
    
    // MARK: - Image Types
    
    /// JPEG image file (e.g., `.jpg`).
    case jpeg = "image/jpeg"
    
    /// PNG image file (e.g., `.png`).
    case png = "image/png"
    
    /// GIF image file (e.g., `.gif`).
    case gif = "image/gif"
    
    /// BMP image file (e.g., `.bmp`).
    case bmp = "image/bmp"
    
    /// WebP image file (e.g., `.webp`).
    case webp = "image/webp"
    
    /// SVG image file (e.g., `.svg`).
    case svg = "image/svg+xml"
    
    // MARK: - Audio/Video Types
    
    /// MP4 video file (e.g., `.mp4`).
    case mp4 = "video/mp4"
    
    /// AVI video file (e.g., `.avi`).
    case avi = "video/avi"
    
    /// MP3 audio file (e.g., `.mp3`).
    case mp3 = "audio/mpeg"
    
    /// WAV audio file (e.g., `.wav`).
    case wav = "audio/wav"
    
    /// AAC audio file (e.g., `.aac`).
    case aac = "audio/aac"
    
    /// MKV video file (e.g., `.mkv`).
    case mkv = "video/x-matroska"
    
    /// M4V video file (e.g., `.m4v`).
    case m4v = "video/x-m4v"
    
    // MARK: - Office Documents Types
    
    /// Word document file (e.g., `.docx`).
    case docx = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    
    /// Legacy Word document file (e.g., `.doc`).
    case doc = "application/msword"
    
    /// Excel spreadsheet file (e.g., `.xlsx`).
    case xlsx = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    
    /// Legacy Excel spreadsheet file (e.g., `.xls`).
    case xls = "application/vnd.ms-excel"
    
    /// PowerPoint presentation file (e.g., `.pptx`).
    case pptx = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    
    /// Legacy PowerPoint presentation file (e.g., `.ppt`).
    case ppt = "application/vnd.ms-powerpoint"
    
    /// PDF file (e.g., `.pdf`).
    case pdf = "application/pdf"
    
    // MARK: - Compressed Archives Types
    
    /// ZIP compressed file (e.g., `.zip`).
    case zip = "application/zip"
    
    /// TAR archive file (e.g., `.tar`).
    case tar = "application/x-tar"
    
    /// GZIP compressed file (e.g., `.gz`).
    case gzip = "application/x-gzip"
    
    /// 7-Zip compressed file (e.g., `.7z`).
    case sevenZip = "application/x-7z-compressed"
    
    /// RAR compressed file (e.g., `.rar`).
    case rar = "application/x-rar-compressed"
    
    // MARK: - Miscellaneous Types
    
    /// Binary file (e.g., `.bin`).
    case binary = "application/octet-stream"
    
    /// Apple installer package (e.g., `.mpkg`).
    case appleInstaller = "application/vnd.apple.installer+xml"
    
    /// ISO disk image file (e.g., `.iso`).
    case iso = "application/x-iso9660-image"
}

// MARK: - MimeType File Extension
extension MimeType {
    
    /// The typical file extension for the MIME type.
    var fileExtension: String {
        switch self {
            case .plainText:
                return "txt"
            case .html:
                return "html"
            case .css:
                return "css"
            case .javascript:
                return "js"
            case .csv:
                return "csv"
            case .json:
                return "json"
            case .xml:
                return "xml"
            case .jpeg:
                return "jpg"
            case .png:
                return "png"
            case .gif:
                return "gif"
            case .bmp:
                return "bmp"
            case .webp:
                return "webp"
            case .svg:
                return "svg"
            case .mp4:
                return "mp4"
            case .avi:
                return "avi"
            case .mp3:
                return "mp3"
            case .wav:
                return "wav"
            case .aac:
                return "aac"
            case .mkv:
                return "mkv"
            case .docx:
                return "docx"
            case .doc:
                return "doc"
            case .xlsx:
                return "xlsx"
            case .xls:
                return "xls"
            case .pptx:
                return "pptx"
            case .ppt:
                return "ppt"
            case .pdf:
                return "pdf"
            case .zip:
                return "zip"
            case .tar:
                return "tar"
            case .gzip:
                return "gz"
            case .sevenZip:
                return "7z"
            case .rar:
                return "rar"
            case .binary:
                return "bin"
            case .appleInstaller:
                return "mpkg"
            case .iso:
                return "iso"
            case .m4v:
                return "m4v"
        }
    }
}

// MARK: - CustomStringConvertible Conformance
extension MimeType: CustomStringConvertible {
    var description: String {
        switch self {
            case .plainText:
                return "Plain Text File (.txt)"
            case .html:
                return "HTML File (.html)"
            case .css:
                return "CSS File (.css)"
            case .javascript:
                return "JavaScript File (.js)"
            case .csv:
                return "CSV File (.csv)"
            case .json:
                return "JSON File (.json)"
            case .xml:
                return "XML File (.xml)"
            case .jpeg:
                return "JPEG Image (.jpg)"
            case .png:
                return "PNG Image (.png)"
            case .gif:
                return "GIF Image (.gif)"
            case .bmp:
                return "BMP Image (.bmp)"
            case .webp:
                return "WebP Image (.webp)"
            case .svg:
                return "SVG Image (.svg)"
            case .mp4:
                return "MP4 Video (.mp4)"
            case .avi:
                return "AVI Video (.avi)"
            case .mp3:
                return "MP3 Audio (.mp3)"
            case .wav:
                return "WAV Audio (.wav)"
            case .aac:
                return "AAC Audio (.aac)"
            case .mkv:
                return "MKV Video (.mkv)"
            case .docx:
                return "Word Document (.docx)"
            case .doc:
                return "Legacy Word Document (.doc)"
            case .xlsx:
                return "Excel Spreadsheet (.xlsx)"
            case .xls:
                return "Legacy Excel Spreadsheet (.xls)"
            case .pptx:
                return "PowerPoint Presentation (.pptx)"
            case .ppt:
                return "Legacy PowerPoint Presentation (.ppt)"
            case .pdf:
                return "PDF File (.pdf)"
            case .zip:
                return "ZIP Archive (.zip)"
            case .tar:
                return "TAR Archive (.tar)"
            case .gzip:
                return "GZIP Archive (.gz)"
            case .sevenZip:
                return "7-Zip Archive (.7z)"
            case .rar:
                return "RAR Archive (.rar)"
            case .binary:
                return "Binary File (.bin)"
            case .appleInstaller:
                return "Apple Installer Package (.mpkg)"
            case .iso:
                return "ISO Disk Image (.iso)"
            case .m4v:
                return "M4V video file (.m4v)"
        }
    }
}
