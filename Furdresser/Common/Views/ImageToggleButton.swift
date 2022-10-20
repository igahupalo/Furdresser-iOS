//
//  ImageToggleButton.swift
//  Furdresser
//
//  Created by Iga Hupalo on 29/04/2021.
//

import UIKit

enum ImageToggleButtonType: Int {
    case secureEntry
    case checkbox
}

class ImageToggleButton: ToggleButton {
    @IBInspectable
    var type: Int = 0 {
        didSet {
            setType(ImageToggleButtonType(rawValue: type) ?? .checkbox)
        }
    }

    var onImage: UIImage?
    var offImage: UIImage?

    override func toggle(isOn: Bool? = nil) {
        super.toggle(isOn: isOn)
        updateImage()
    }

    func updateImage() {
        setImage(isOn ? onImage : offImage, for: .normal)
    }

    func setType(_ type: ImageToggleButtonType) {
        switch type {
        case .secureEntry:
            onImage = UIImage(systemName: "eye.fill")
            offImage = UIImage(systemName: "eye.slash.fill")
        case .checkbox:
            onImage = UIImage(systemName: "record.circle")
            offImage = UIImage(systemName: "circle")
        }
        updateImage()
    }
}
