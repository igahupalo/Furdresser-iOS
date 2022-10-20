//
//  ReferencePhotoCollectionViewCell.swift
//  Furdresser
//
//  Created by Iga Hupalo on 19/05/2021.
//

import UIKit

class ReferencePhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageButton: RoundedButton!

    func setImage(image: UIImage?) {
        imageButton.setBackgroundImage(image, for: .normal)
    }

    @IBAction func didTapButton(_ sender: Any) {
        // TODO: Expand photo to fullscreen.
    }
}
