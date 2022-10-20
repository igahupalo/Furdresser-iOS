//
//  UIView+CircleShape.swift
//  Furdresser
//
//  Created by Iga Hupalo on 29/04/2021.
//

import UIKit

extension UIView {
    func setCircleShape(borderColor: CGColor? = nil, borderWidth: CGFloat? = nil) {

        setBorder(borderWidth: borderWidth,
                  borderColor: borderColor,
                  cornerRadius: layer.bounds.height / 2)
    }
}
