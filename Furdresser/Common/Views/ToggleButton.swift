//
//  ToggleButton.swift
//  Furdresser
//
//  Created by Iga Hupalo on 29/04/2021.
//

import UIKit

class ToggleButton: UIButton {
    var isOn: Bool = false

    func toggle(isOn: Bool? = nil) {
        if let isOn = isOn {
            self.isOn = isOn
        } else {
            self.isOn = !self.isOn
        }
    }
}
