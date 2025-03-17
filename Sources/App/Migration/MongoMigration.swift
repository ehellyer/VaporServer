//
//  MongoMigration.swift
//
//
//  Created by Ed Hellyer on 9/2/24.
//

import Foundation
import Fluent

struct CreateAddress: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Address.schema)
            .id()
            .field("unitNumber", .string)
            .field("street", .string, .required)
            .field("crossStreetDescription", .string)
            .field("postalBox", .string)
            .field("city", .string, .required)
            .field("county", .string, .required)
            .field("postCode", .string, .required)
            .field("countryCode", .custom(CountryCode.self), .required)
            .field("coordinate", .uuid)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Address.schema).delete()
    }
}

struct CreateCoordinate: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Coordinate.schema)
            .id()
            .field("latitude", .double, .required)
            .field("longitude", .double, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema(Coordinate.schema).delete()
    }
}

struct CreateGalaxy: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Galaxy.schema)
            .id()
            .field("name", .string)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(Galaxy.schema).delete()
    }
}

struct CreateStar: AsyncMigration {
    // Prepares the database for storing Star models.
    func prepare(on database: Database) async throws {
        try await database.schema(Star.schema)
            .id()
            .field("name", .string)
            .field("galaxy_id", .uuid, .references(Galaxy.schema, "id"))
            .create()
    }
    
    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) async throws {
        try await database.schema(Star.schema).delete()
    }
}
