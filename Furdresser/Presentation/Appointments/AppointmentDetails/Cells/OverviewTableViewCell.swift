//
//  OverviewTableViewCell.swift
//  Furdresser
//
//  Created by Iga Hupalo on 16/05/2021.
//

import UIKit

protocol OverviewDelegate: AnyObject {
    func didTapCallButton()
    func didTapSendButton()
    func didTapCancelButton()
}

class OverviewTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var topCircleView: UIView!
    @IBOutlet weak var topRingView: UIView!
    @IBOutlet weak var bottomRingView: UIView!
    @IBOutlet weak var bottomCircleView: UIView!

    @IBOutlet weak var appointmentImageImageView: RoundedImage!

    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!

    @IBOutlet weak var callOwnerButton: RoundedButton!
    @IBOutlet weak var sendNotificationButton: RoundedButton!
    @IBOutlet weak var cancelButton: RoundedButton!

    // MARK: -

    weak var delegate: OverviewDelegate?

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: Display Logic

    func setup(viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel.Overview,
               delegate: OverviewDelegate) {
        self.delegate = delegate
        inflate(with: viewModel)
    }

    // MARK: - Actions

    @IBAction func didTapCallButton(_ sender: Any) {
        delegate?.didTapCallButton()
    }

    @IBAction func didTapSendButton(_ sender: Any) {
        delegate?.didTapSendButton()
    }

    @IBAction func didTapCancelButton(_ sender: Any) {
        delegate?.didTapCancelButton()
    }
}

private extension OverviewTableViewCell {
    func setupUI() {
        let borderColor = (UIColor(named: "Primary15") ?? #colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)).cgColor

        topCircleView.setCircleShape()
        topRingView.setCircleShape(borderColor: borderColor, borderWidth: 30)
        bottomCircleView.setCircleShape()
        bottomRingView.setCircleShape(borderColor: borderColor, borderWidth: 50)
    }

    func inflate(with viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel.Overview) {
        if let image = viewModel.appointmentImage {
            appointmentImageImageView.image = image
        } else {
            appointmentImageImageView.image = UIImage(named: "AppointmentImagePlaceholder")
        }
        dogNameLabel.text = viewModel.petName
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        weightLabel.text = viewModel.weight
        ageLabel.text = viewModel.age
        breedLabel.text = viewModel.breed
    }
}
