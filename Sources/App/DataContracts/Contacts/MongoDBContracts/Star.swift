//
//  Star.swift
//
//
//  Created by Ed Hellyer on 11/26/23.
//

import Foundation
import Vapor
import Fluent

final class Star: Model, Content, @unchecked Sendable {

    // Name of the table or collection.
    static let schema = "stars"
    
    // Unique identifier for this Star.
    @ID(key: .id)
    var id: UUID?
    
    // The Star's name.
    @Field(key: "name")
    var name: String
    
    // Reference to the Galaxy this Star is in.
    @Parent(key: "galaxy_id")
    var galaxy: Galaxy
    
    // Creates a new, empty Star.
    init() { }
    
    // Creates a new Star with all properties set.
    init(id: UUID? = nil, name: String, galaxyId: UUID) {
        self.id = id
        self.name = name
        self.$galaxy.id = galaxyId
    }
}
