//
//  AuthenticationMiddleware.swift
//
//
//  Created by Ed Hellyer on 10/3/23.
//

import Foundation
import Vapor

struct UserAuthenticator: AsyncBearerAuthenticator {
    
    func authenticate(bearer: Vapor.BearerAuthorization, for request: Vapor.Request) async throws {
        
        //TODO:  Implement OAuth2 security here.
        guard bearer.token == "pewpewpewpew" else {
            throw Abort(.unauthorized, reason: "Invalid auth token.")
        }
        
        request.auth.login(User(user: "Ed"))
    }
}

struct AuthenticationMiddleware: AsyncMiddleware {
    let userAuthenticator = UserAuthenticator()
    
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard let authToken = request.headers.bearerAuthorization else {
            throw Abort(.unauthorized)
        }
        
        try await self.userAuthenticator.authenticate(bearer: authToken, for: request)
        
        return try await next.respond(to: request)
    }
}
