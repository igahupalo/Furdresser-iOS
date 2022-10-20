//
//  AppointmentDetailsCellFactory.swift
//  Furdresser
//
//  Created by Iga Hupalo on 16/05/2021.
//

import UIKit

protocol AppointmentDetailsCellFactoryProtocol {
    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
    func numberOfRows(for section: Int) -> Int
    func numberOfSections() -> Int

    var viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel? { get set }
}

class AppointmentDetailsCellFactory: AppointmentDetailsCellFactoryProtocol {

    private let tableView: UITableView
    let taskDelegate: TaskDelegate
    let overviewDelegate: OverviewDelegate

    var viewModel: AppointmentDetailsScene.FetchAppointmentDetails.ViewModel?

    init(tableView: UITableView,
         taskDelegate: TaskDelegate,
         overviewDelegate: OverviewDelegate) {
        self.tableView = tableView
        self.taskDelegate = taskDelegate
        self.overviewDelegate = overviewDelegate
    }

    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        switch section {
        case AppointmentDetailsSections.overview.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: OverviewTableViewCell.defaultIdentifier()) as! OverviewTableViewCell
            if let viewModel = viewModel?.overview {
                cell.setup(viewModel: viewModel,
                           delegate: overviewDelegate)
            }
            return cell

        case AppointmentDetailsSections.package.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: PackageTableViewCell.defaultIdentifier()) as! PackageTableViewCell
            if let viewModel = viewModel?.package {
                cell.setup(viewModel: viewModel)
            }
            return cell

        case AppointmentDetailsSections.tasks.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.defaultIdentifier()) as! TaskTableViewCell
            if let viewModel = viewModel?.tasks.tasks[indexPath.row] {
                cell.setup(viewModel: viewModel,
                           indexPath: indexPath,
                           delegate: taskDelegate)
            }
            return cell

        case AppointmentDetailsSections.notes.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.defaultIdentifier()) as! NotesTableViewCell
            if let viewModel = viewModel?.notes {
                cell.setup(viewModel: viewModel)
            }
            return cell

//            TODO: Temporarly omitted reference photos.

//        case AppointmentDetailsSections.referencePhotos.rawValue:
//            let cell = tableView.dequeueReusableCell(withIdentifier: ReferencePhotosTableViewCell.defaultIdentifier()) as! ReferencePhotosTableViewCell
//            return cell

        default:
            return UITableViewCell()
        }
    }

    func numberOfRows(for section: Int) -> Int {
        switch section {
        case AppointmentDetailsSections.tasks.rawValue:
            return viewModel?.tasks.tasks.count ?? 0
        default:
            return 1
        }
    }

    func numberOfSections() -> Int {
        AppointmentDetailsSections.numberOfCases()
    }
}

enum AppointmentDetailsSections: Int {
    case overview
    case package
    case tasks
    case notes
    case referencePhotos

    static func allCases() -> [AppointmentDetailsSections] {
        [.overview, .package, .tasks, .notes]
    }

    static func numberOfCases() -> Int {
        allCases().count
    }
}
