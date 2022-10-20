//
//  ManagerTabBarConfigurator.swift
//  Furdresser
//
//  Created by Iga Hupalo on 05/06/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension ManagerTabBarInteractor: ManagerTabBarViewControllerOutput, ManagerTabBarRouterDataSource, ManagerTabBarRouterDataDestination {
}

extension ManagerTabBarPresenter: ManagerTabBarInteractorOutput {
}

class ManagerTabBarConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = ManagerTabBarConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: ManagerTabBarViewController) {
        
        let presenter = ManagerTabBarPresenter()
        presenter.output = viewController
        
        let interactor = ManagerTabBarInteractor()
        interactor.output = presenter
        
        let router = ManagerTabBarRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
