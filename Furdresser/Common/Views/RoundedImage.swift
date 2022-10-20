//
//  RoundedImage.swift
//  Furdresser
//
//  Created by Iga Hupalo on 18/05/2021.
//

import UIKit

class RoundedImage: UIImageView {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
