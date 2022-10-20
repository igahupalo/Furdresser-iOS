//
//  RoundedView.swift
//  Furdresser
//
//  Created by Iga Hupalo on 05/05/2021.
//

import UIKit

class RoundedView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
