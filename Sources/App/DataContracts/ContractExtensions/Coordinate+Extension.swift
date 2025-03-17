//
//  Coordinate+Extension.swift
//  Membership
//
//  Created by Ed Hellyer on 8/31/24.
//

import Foundation
import CoreLocation

extension Coordinate {
    
    ///Returns the Location as an instance of CLLocationCoordinate2D
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    ///Returns a Boolean value indicating whether the specified coordinate is valid.
    ///
    ///A coordinate is considered invalid if it meets at least one of the following criteria:
    /// - Its latitude is greater than 90 degrees or less than -90 degrees.
    /// - Its longitude is greater than 180 degrees or less than -180 degrees.
    /// - Lat and Long are not both 0, because we will not have any locations in the West African Atlantic Ocean, and this check removes a bug where lat/long initialize to zero.
    var isValid: Bool {
        return self.latitude != 0 && self.longitude != 0 && CLLocationCoordinate2DIsValid(self.coordinate)
    }
}
