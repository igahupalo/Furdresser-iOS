//
//  ReferenceTableViewCell.swift
//  Furdresser
//
//  Created by Iga Hupalo on 18/05/2021.
//

import UIKit

class ReferencePhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ReferencePhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReferencePhotoCollectionViewCell.defaultIdentifier(), for: indexPath) as! ReferencePhotoCollectionViewCell
        cell.setImage(image: UIImage(named: "Image"))
        
        return cell
    }
}
