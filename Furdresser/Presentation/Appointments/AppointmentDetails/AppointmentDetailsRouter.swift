//
//  AppointmentDetailsRouter.swift
//  Furdresser
//
//  Created by Iga Hupalo on 24/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol AppointmentDetailsRouterInput {
    
}

protocol AppointmentDetailsRouterDataSource: AnyObject {
}

protocol AppointmentDetailsRouterDataDestination: AnyObject {
    var appointment: Appointment? { get set }
}

class AppointmentDetailsRouter: AppointmentDetailsRouterInput {
    
    weak var viewController: AppointmentDetailsViewController!
    weak private var dataSource: AppointmentDetailsRouterDataSource!
    weak var dataDestination: AppointmentDetailsRouterDataDestination!
    
    init(viewController: AppointmentDetailsViewController, dataSource: AppointmentDetailsRouterDataSource, dataDestination: AppointmentDetailsRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation

    func navigateBack() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Communication

    func passDataToNextScene(for segue: UIStoryboardSegue) {

    }
}
