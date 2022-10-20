//
//  GroomerAppointmentPreviewTableViewCell.swift
//  Furdresser
//
//  Created by Iga Hupalo on 06/06/2021.
//

import UIKit

protocol GroomerAppointmentPreviewDelegate: AnyObject {
    func didSelectWorkerAppointmentAt(indexPath: IndexPath)
}

class GroomerAppointmentPreviewTableViewCell: UITableViewCell {

    @IBOutlet weak var appointmentImageImageView: UIImageView!
    @IBOutlet weak var groomerNameView: RoundedView!
    @IBOutlet weak var groomerNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!

    var indexPath: IndexPath?
    weak var delegate: GroomerAppointmentPreviewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if let indexPath = indexPath {
            delegate?.didSelectWorkerAppointmentAt(indexPath: indexPath)
        }
    }

    func setup(viewModel: AppointmentsScene.FetchAppointments.ViewModel.DisplayedAppointment,
               indexPath: IndexPath,
               delegate: GroomerAppointmentPreviewDelegate) {

        self.indexPath = indexPath
        self.delegate = delegate

        inflate(with: viewModel)
    }
}

private extension GroomerAppointmentPreviewTableViewCell {
    func setupUI() {
        appointmentImageImageView.setCornerRadius(cornerRadius: 5)
    }

    func inflate(with viewModel: AppointmentsScene.FetchAppointments.ViewModel.DisplayedAppointment) {
        if let image = viewModel.image {
            appointmentImageImageView.image = image
        } else {
            appointmentImageImageView.image = UIImage(named: "AppointmentImagePlaceholder")
        }

        groomerNameLabel.text = viewModel.workerName
        groomerNameView.backgroundColor = viewModel.workerColor
        timeLabel.text = viewModel.time
        petNameLabel.text = viewModel.petName
        ownerNameLabel.text = viewModel.ownerName
    }
}
