//
//  Task.swift
//  Furdresser
//
//  Created by Iga Hupalo on 03/06/2021.
//

import Foundation

class Task {
    var id: String?
    var name: String?
    var isCompleted: Bool = false

    init(name: String?,
         isCompleted: Bool = false) {
        self.name = name
        self.isCompleted = isCompleted
    }
}
