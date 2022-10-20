//
//  Appointment.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//

import UIKit
// TODO Fix dis
import FirebaseFirestore

class Appointment {
    var id: String?
    var name: String?
    var age: Float?
    var weight: Float?
    var image: UIImage?
    var ownerName: String?
    var startDate: Date?
    var endDate: Date?
    var breed: String?
    var notes: String?
    var phoneNumber: String?
    var package: Package?
    var workerId: String?
    var workerRef: DocumentReference?

    // TODO: Extract this
    // Bardzo się spieszę, to jest bałagan, nie pozbieram się po tym, rip moje repo, rip potencjalne oferty pracy
    var workerName: String?
    var workerColor: UIColor?

    init(name: String?,
         age: Float?,
         weight: Float?,
         image: UIImage? = nil,
         ownerName: String?,
         startDate: Date?,
         endDate: Date?,
         // TODO Fix dis
         workerRef: DocumentReference? = nil) {
        self.name = name
        self.age = age
        self.weight = weight
        self.image = image
        self.ownerName = ownerName
        self.startDate = startDate
        self.endDate = endDate
        // TODO Fix dis
        self.workerRef = workerRef
    }

    func setDetails(details: AppointmentDetails) {
        self.breed = details.breed
        self.notes = details.notes
        self.phoneNumber = details.phoneNumber
        self.package = details.package
    }
}
