//
//  File.swift
//  
//
//  Created by Ed Hellyer on 11/26/23.
//

import Foundation
import Vapor
import Fluent

final class Galaxy: Model, Content, @unchecked Sendable {

    // Name of the table or collection.
    static let schema = "galaxies"
    static let space: String? = nil
    static let alias: String? = nil
    
    // Unique identifier for this Galaxy.
    @ID(key: .id)
    var id: UUID?
    
    // The Galaxy's name.
    @Field(key: "name")
    var name: String
    
    // All the Stars in this Galaxy.
    @Children(for: \.$galaxy)
    var stars: [Star]
    
    // Creates a new, empty Galaxy.
    init() { }
    
    // Creates a new Galaxy with all properties set.
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
