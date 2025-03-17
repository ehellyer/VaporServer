//
//  User.swift
//
//
//  Created by Ed Hellyer on 10/3/23.
//

import Foundation
import Vapor
import Fluent

class User: Authenticatable {
   
    init(user: String) {
        self.user = user
    }
    
    var user: String
}
