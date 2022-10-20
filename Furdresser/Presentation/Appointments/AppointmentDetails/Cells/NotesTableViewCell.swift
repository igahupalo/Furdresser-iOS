//
//  NotesTableViewCell.swift
//  Furdresser
//
//  Created by Iga Hupalo on 18/05/2021.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var notesContentLabel: UILabel!

    func setup(viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel.Notes) {
        inflate(with: viewModel)
    }
}

private extension NotesTableViewCell {

    func inflate(with viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel.Notes) {
        notesContentLabel.text = viewModel.notes
        if viewModel.notes == "" {
            notesContentLabel.text = "Brak notatek"
        }
    }
}
