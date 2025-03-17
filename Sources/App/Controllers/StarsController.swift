//
//  StarsController.swift
//  vapor-server
//
//  Created by Ed Hellyer on 11/26/23.
//

import Foundation
import Vapor
import Fluent

struct StarsController: RouteCollection {
    
    /// Initialize the routing for the GalaxiesController
    /// - Parameter routes: Reference to the server route builder.
    func boot(routes: Vapor.RoutesBuilder) throws {
        let starRouter = routes.grouped("api", "stars")
        
        starRouter.get("index", use: listStars)
        
        // POST /api/stars/star
        starRouter.post("star", use: createStar)
    }
   
    
    /// GET /api/stars/index
    /// - Parameter req: HTTP Request from client
    /// - Returns: Returns a list of `Star`
    func listStars(req: Request) async throws -> [Star] {
        let stars = try await Star.query(on: req.db).all()
        return stars
    }
    
    /// POST /api/stars/star
    ///
    /// Used to create a new `Star` record.
    /// - Parameter req: HTTP Request from client
    /// - Returns: Returns the instance of the newly created `Star`.
    func createStar(req: Request) async throws -> Star {
        let star = try req.content.decode(Star.self)
        try await star.create(on: req.db)
        return star
    }
}
