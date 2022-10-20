//
//  Package.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//

import Foundation

class Package {
    var name: String?
    var tasks: [Task]

    init(name: String?,
         tasks: [Task] = []) {
        self.name = name
        self.tasks = tasks
    }
}
