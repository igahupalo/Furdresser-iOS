//
//  AppointmentsConfigurator.swift
//  Furdresser
//
//  Created by Iga Hupalo on 24/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension AppointmentsInteractor: AppointmentsViewControllerOutput, AppointmentsRouterDataSource, AppointmentsRouterDataDestination {
}

extension AppointmentsPresenter: AppointmentsInteractorOutput {
}

class AppointmentsConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = AppointmentsConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: AppointmentsViewController) {
        
        let presenter = AppointmentsPresenter()
        presenter.output = viewController
        
        let interactor = AppointmentsInteractor()
        interactor.output = presenter
        
        let router = AppointmentsRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
