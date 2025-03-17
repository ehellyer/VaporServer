//
//  Coordinate.swift
//  Membership
//
//  Created by Ed Hellyer on 9/1/24.
//

import Foundation
import CoreLocation
import Fluent
import Vapor

final class Coordinate: Model, Content, @unchecked Sendable {

    static let schema = "coordinates"
    static let space: String? = nil
    static let alias: String? = nil
    
    init () { }
    
    init (latitude: Double,
          longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(coordinate2D: CLLocationCoordinate2D) {
        self.latitude = coordinate2D.latitude
        self.longitude = coordinate2D.longitude
    }
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "latitude")
    var latitude: Double
    
    @Field(key: "longitude")
    var longitude: Double
}
