//
//  Float+Formatters.swift
//  Furdresser
//
//  Created by Iga Hupalo on 03/06/2021.
//

import Foundation

extension Float {
    mutating func mapToLocalizedAgeString() -> String {
        var ageText = ""
        var ageUnitText = ""

        let roundedAge = (self * 2).rounded() / 2
        let lastDigit = roundedAge < 10 ? roundedAge : roundedAge - (roundedAge / 10) * 10

        if roundedAge != roundedAge.rounded() {
            ageUnitText = NSLocalizedString("years.5", comment: "Age unit")
        } else if roundedAge == 1 {
            ageUnitText = NSLocalizedString("year", comment: "Age unit")
        } else if [2, 3, 4].contains(lastDigit)  {
            ageUnitText = NSLocalizedString("years<5", comment: "Age unit")
        } else {
            ageUnitText = NSLocalizedString("years0,5<=", comment: "Age unit")
        }

        ageText = String(format: "%g", roundedAge) + " " + ageUnitText
        
        return ageText
    }
    
    func mapToLocalizedWeightString() -> String {
        var weightText = ""

        weightText = String(describing: self) + " " + NSLocalizedString("kg", comment: "Weight unit")
        
        return weightText
    }
}
