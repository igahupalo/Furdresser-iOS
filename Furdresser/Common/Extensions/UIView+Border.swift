//
//  UIView+Border.swift
//  Furdresser
//
//  Created by Iga Hupalo on 30/04/2021.
//

import UIKit

extension UIView {
    func setBorder(borderWidth: CGFloat?, borderColor: CGColor?, cornerRadius: CGFloat? = nil) {
        layer.borderWidth = borderWidth ?? 0
        layer.borderColor = borderColor ?? UIColor.clear.cgColor
        if let cornerRadius = cornerRadius { setCornerRadius(cornerRadius: cornerRadius) }
    }
}
