//
//  AppointmentPreviewTableViewCell.swift
//  Furdresser
//
//  Created by Iga Hupalo on 30/04/2021.
//

import UIKit

protocol AppointmentPreviewDelegate: AnyObject {
    func didSelectUserAppointmentAt(indexPath: IndexPath)
}

class AppointmentPreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var appointmentImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    var indexPath: IndexPath?
    weak var delegate: AppointmentPreviewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if let indexPath = indexPath {
            delegate?.didSelectUserAppointmentAt(indexPath: indexPath)
        }
    }

    func setup(viewModel: AppointmentsScene.FetchAppointments.ViewModel.DisplayedAppointment,
               indexPath: IndexPath,
               delegate: AppointmentPreviewDelegate) {

        self.indexPath = indexPath
        self.delegate = delegate

        inflate(with: viewModel)
    }
}

private extension AppointmentPreviewTableViewCell {
    func setupUI() {
        appointmentImageView.setCornerRadius(cornerRadius: 5)
    }

    func inflate(with viewModel: AppointmentsScene.FetchAppointments.ViewModel.DisplayedAppointment) {
        if let image = viewModel.image {
            appointmentImageView.image = image
        } else {
            appointmentImageView.image = UIImage(named: "AppointmentImagePlaceholder")
        }

        timeLabel.text = viewModel.time
        petNameLabel.text = viewModel.petName
        ownerNameLabel.text = viewModel.ownerName
        weightLabel.text = viewModel.weight
        ageLabel.text = viewModel.age
    }
}
