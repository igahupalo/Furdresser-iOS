//
//  User.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//

import Foundation

class User {
    var uid: String?
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var role: UserRole = .groomer

    init(dict: [String: Any]) {
        firstName = dict["name"] as! String?
        lastName = dict["surname"] as! String?
        phoneNumber = dict["phone_number"] as! String?
        role = (dict["role"] as! String?) == "groomer" ? .groomer : .manager
    }
}
