//
//  TasksTableViewCell.swift
//  Furdresser
//
//  Created by Iga Hupalo on 16/05/2021.
//

import UIKit

class PackageTableViewCell: UITableViewCell {

    @IBOutlet weak var packageNameLabel: UILabel!

    func setup(viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel.Package) {
        inflate(with: viewModel)
    }
}

private extension PackageTableViewCell {

    func inflate(with viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel.Package) {
        packageNameLabel.text = viewModel.name
    }
}
