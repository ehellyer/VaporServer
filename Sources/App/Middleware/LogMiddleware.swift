//
//  LogMiddleware.swift.swift
//
//
//  Created by Ed Hellyer on 10/3/23.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware {
    
    func respond(to request: Vapor.Request, chainingTo next: Vapor.AsyncResponder) async throws -> Vapor.Response {
        print("_________________________________________")
        print("\nRequest URL:\n\(request.method.rawValue) \(request.url)")
        print("\nRequest Headers:")
        for (name, value) in request.headers.makeIterator() {
            let header = "\(name): \(value)"
            print(header)
        }
        if let postBody = request.body.string {
            let body = "\nRequest Body:\n\(postBody)\n"
            print(body)
        }
        return try await next.respond(to: request)
    }
    
    
}
