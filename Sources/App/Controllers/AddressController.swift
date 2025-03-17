//
//  AddressController.swift
//
//
//  Created by Ed Hellyer on 9/2/24.
//

import Foundation
import Vapor
import Fluent

struct AddressController: RouteCollection {
    /// Initialize the routing for the AddressController
    /// - Parameter routes: Reference to the server route builder.
    func boot(routes: Vapor.RoutesBuilder) throws {
        let router = routes.grouped("api", "address")
        
        // GET /api/address/index
        router.get("index", use: allAddresses)
        
        // GET /api/address/:addressId
        router.get(":addressId", use: addressByRequestParamId)
        
        // POST /api/address
        router.post(use: createAddress)
        
        // PUT /api/address/:addressId
        router.put(use: updateAddress)
        
        // DELETE /api/address/:addressId
        router.delete(":addressId", use: deleteAddressByRequestParamId)
    }
 
    
    private func allAddresses(req: Request) async throws -> [Address] {
        let addresses = try await Address.query(on: req.db).all()
        return addresses
    }
    
    private func addressByRequestParamId(req: Request) async throws -> Address {
        guard let addressId = req.parameters.get("addressId", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        let address = try await self.addressById(addressId, db: req.db)
        return address
    }
    
    private func addressById(_ addressId: UUID, db: any Database) async throws -> Address {
        guard let address = try await Address.find(addressId, on: db) else {
            throw Abort(.notFound, reason: "Address \(addressId) not found in the database.")
        }
        return address
    }
    
    private func createAddress(req: Request) async throws -> Address {
        let address = try req.content.decode(Address.self)
        if let coordinate = address.coordinate {
            try await coordinate.create(on: req.db)
        }
        try await address.create(on: req.db)
        return address
    }
    
    private func updateAddress(req: Request) async throws -> Address {
        let updatedAddress = try req.content.decode(Address.self)
        guard let addressId = updatedAddress.id else {
            throw Abort(.badRequest, reason: "Request body does not include Id of address to update.")
        }

        let address = try await self.addressById(addressId, db: req.db)
        address.unitNumber = updatedAddress.unitNumber
        address.crossStreetDescription = updatedAddress.crossStreetDescription
        address.street = updatedAddress.street
        address.city = updatedAddress.city
        address.postCode = updatedAddress.postCode
        address.postalBox = updatedAddress.postalBox
        address.coordinate = updatedAddress.coordinate
        
        try await address.update(on: req.db)
        return address
    }

    private func deleteAddressByRequestParamId(req: Request) async throws -> Address {
        let address = try await self.addressByRequestParamId(req: req)
        if let coordinate = address.coordinate {
            try await coordinate.delete(on: req.db)
        }
        try await address.delete(on: req.db)
        return address
    }
}
