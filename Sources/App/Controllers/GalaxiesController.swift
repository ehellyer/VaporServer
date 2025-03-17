//
//  GalaxiesController.swift
//
//
//  Created by Ed Hellyer on 11/26/23.
//

import Foundation
import Vapor
import Fluent

struct GalaxiesController: RouteCollection {
    
    /// Initialize the routing for the GalaxiesController
    /// - Parameter routes: Reference to the server route builder.
    func boot(routes: Vapor.RoutesBuilder) throws {
        let galaxyRouter = routes.grouped("api", "galaxies")
        
        // GET /api/galaxies/index
        galaxyRouter.get("index", use: galaxiesIndex)
        
        // POST /api/galaxies
        galaxyRouter.post(use: createGalaxy)
        
        // GET /api/galaxies/:galaxyId/stars
        galaxyRouter.get(":galaxyId", "stars", use: starsByGalaxyId)
        
        // DELETE /api/galaxies/:galaxyId
        galaxyRouter.delete(":galaxyId", use: deleteGalaxy)
    }
    
    /// GET api/galaxies
    /// - Parameter req: HTTP Request from client.
    /// - Returns: Returns index of galaxies.
    private func galaxiesIndex(req: Request) async throws -> [Galaxy] {
        let galaxies = try await Galaxy.query(on: req.db).with(\.$stars).all()
        return galaxies
    }
    
    /// POST api/galaxies
    ///
    /// Used to create a new `Galaxy` record.
    /// - Parameter req: HTTP Request from client
    /// - Returns: Returns the instance of the newly created `Galaxy`.
    private func createGalaxy(req: Request) async throws -> Galaxy {
        let galaxy = try req.content.decode(Galaxy.self)
        try await galaxy.create(on: req.db)
        return galaxy
    }
    
    /// GET api/galaxies/{galaxyId}/stars
    /// - Parameter req: HTTP Request from client.
    /// - Returns: Returns a list of stars for the specified galaxy Id.
    private func starsByGalaxyId(req: Request) async throws -> [Star] {
        
        //Accessing the route parameter by name, strongly typing to UUID
        guard let galaxyId = req.parameters.get("galaxyId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        let galaxy = try await Galaxy.query(on: req.db).with(\.$stars).filter(\.$id == galaxyId).first()
        let stars = galaxy?.stars ?? []
        return stars
    }
    
    /// POST api/galaxies
    ///
    /// Used to create a new `Star` record.
    /// - Parameter req: HTTP Request from client
    /// - Returns: Returns the instance of the newly created `Star`.
    private func createStar(req: Request) async throws -> Star {
        let star = try req.content.decode(Star.self)
        try await star.create(on: req.db)
        return star
    }
    
    private func deleteGalaxy(req: Request) async throws -> Galaxy {
        //Accessing the route parameter by name, strongly typing to UUID
        guard let galaxyId = req.parameters.get("galaxyId", as: UUID.self) else {
            throw Abort(.badRequest)
        }

        guard let galaxy = try await Galaxy.find(galaxyId, on: req.db) else {
            throw Abort(.notFound, reason: "Galaxy \(galaxyId) not found in the database.")
        }
        
        try await galaxy.delete(on: req.db)
        return galaxy

    }
}
