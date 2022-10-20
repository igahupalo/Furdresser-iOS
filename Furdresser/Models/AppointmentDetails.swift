//
//  AppointmentDetails.swift
//  Furdresser
//
//  Created by Iga Hupalo on 02/06/2021.
//

import Foundation
import FirebaseFirestore

struct AppointmentDetails {
    var breed: String?
    var notes: String?
    var phoneNumber: String?
    var package: Package?
    var workerRef: DocumentReference?
}
