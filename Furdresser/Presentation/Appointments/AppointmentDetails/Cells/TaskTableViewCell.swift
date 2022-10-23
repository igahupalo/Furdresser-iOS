//
//  TaskTableViewCell.swift
//  Furdresser
//
//  Created by Iga Hupalo on 18/05/2021.
//

import UIKit

protocol TaskDelegate: AnyObject {
    func didToggleTaskAt(indexPath: IndexPath)
}

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var button: ToggleButton!

    weak var delegate: TaskDelegate?
    private var indexPath: IndexPath?

    func setup(viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel.Tasks.DisplayedTask,
               indexPath: IndexPath,
               delegate: TaskDelegate?) {
        self.indexPath = indexPath
        self.delegate = delegate
        inflate(with: viewModel)
    }

    @IBAction func didTapButton(_ sender: Any) {
        if let indexPath = indexPath {
            delegate?.didToggleTaskAt(indexPath: indexPath)
        }
    }
}

private extension TaskTableViewCell {

    func inflate(with viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel.Tasks.DisplayedTask) {
        button.setTitle(viewModel.name, for: .normal)
        button.toggle(isOn: viewModel.isCompleted)
    }
}
