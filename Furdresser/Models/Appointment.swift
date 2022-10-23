//
//  Appointment.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//

import UIKit

class Appointment {
    var id: String?
    var name: String?
    var age: Float?
    var weight: Float?
    var image: UIImage?
    var ownerName: String?
    var startDate: Date?
    var endDate: Date?

    init(name: String?,
         age: Float?,
         weight: Float?,
         image: UIImage? = nil,
         ownerName: String?,
         startDate: Date?,
         endDate: Date?) {
        self.name = name
        self.age = age
        self.weight = weight
        self.image = image
        self.ownerName = ownerName
        self.startDate = startDate
        self.endDate = endDate
    }
}
