//
//  SplashLoadingRouter.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol SplashLoadingRouterInput {
    
}

protocol SplashLoadingRouterDataSource: AnyObject {
    var currentUser: User? { get }
}

protocol SplashLoadingRouterDataDestination: AnyObject {
}

class SplashLoadingRouter: SplashLoadingRouterInput {
    
    weak var viewController: SplashLoadingViewController!
    weak private var dataSource: SplashLoadingRouterDataSource!
    weak var dataDestination: SplashLoadingRouterDataDestination!

    struct SegueIdentifiers {
        static let groomerTabBar = "GroomerTabBar"
        static let managerTabBar = "ManagerTabBar"
        static let start = "Start"
    }
    
    init(viewController: SplashLoadingViewController, dataSource: SplashLoadingRouterDataSource, dataDestination: SplashLoadingRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation

    func navigateToGroomerTabBar() {
        viewController.performSegue(withIdentifier: SegueIdentifiers.groomerTabBar, sender: nil)
    }

    func navigateToManagerTabBar() {
        viewController.performSegue(withIdentifier: SegueIdentifiers.managerTabBar, sender: nil)
    }

    func navigateToStart() {
        viewController.performSegue(withIdentifier: SegueIdentifiers.start, sender: nil)
    }
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        if let groomerTabBarViewController = segue.destination as? GroomerTabBarViewController {
            groomerTabBarViewController.router?.dataDestination.currentUser = dataSource.currentUser
        }

        if let managerTabBarViewController = segue.destination as? ManagerTabBarViewController {
            managerTabBarViewController.router?.dataDestination.currentUser = dataSource.currentUser
        }
    }
}
