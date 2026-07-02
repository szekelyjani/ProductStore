//
//  User.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 02..
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var dateOfBirth: Date = .now
    var premiumPackaging = false
    var fastDelivery = false
}


