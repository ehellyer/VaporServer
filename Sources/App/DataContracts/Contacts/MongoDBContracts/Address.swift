//
//  Address.swift
//  Membership
//
//  Created by Ed Hellyer on 8/31/24.
//

import Foundation
import Vapor
import Fluent

final class Address: Model, Content, @unchecked Sendable {
    
    static let schema = "addresses"
    static let space: String? = nil
    static let alias: String? = nil
    
    init() { }
    
    init(id: UUID? = nil,
         unitNumber: String? = nil,
         street: String,
         crossStreetDescription: String? = nil,
         postalBox: String? = nil,
         city: String,
         county: String,
         postCode: String,
         countryCode: CountryCode,
         coordinate: Coordinate? = nil) {
        
        self.id = id
        self.unitNumber = unitNumber
        self.street = street
        self.crossStreetDescription = crossStreetDescription
        self.postalBox = postalBox
        self.city = city
        self.county = county
        self.postCode = postCode
        self.countryCode = countryCode
        self.coordinate = coordinate
    }

    @ID(key: .id)
    var id: UUID?
    
    @OptionalField(key: "unitNumber")
    var unitNumber: String?

    @Field(key: "street")
    var street: String
    
    @OptionalField(key: "crossStreetDescription")
    var crossStreetDescription: String?
    
    @OptionalField(key: "postalBox")
    var postalBox: String?
    
    @Field(key: "city")
    var city: String
    
    @Field(key: "county")
    var county: String
    
    @Field(key: "postCode")
    var postCode: String
    
    @Enum(key: "countryCode")
    var countryCode: CountryCode
    
    @Field(key: "coordinate")
    var coordinate: Coordinate?
}
