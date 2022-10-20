//
//  LoginRouter.swift
//  Furdresser
//
//  Created by Iga Hupalo on 24/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol LoginRouterInput {
    func navigateToGroomerTabBarScene()
}

protocol LoginRouterDataSource: AnyObject {
    
}

protocol LoginRouterDataDestination: AnyObject {
    
}

class LoginRouter: LoginRouterInput {
    
    weak var viewController: LoginViewController!
    weak private var dataSource: LoginRouterDataSource!
    weak var dataDestination: LoginRouterDataDestination!

    struct SegueIdentifiers {
        static let groomerTabBar = "GroomerTabBar"
    }
    
    init(viewController: LoginViewController, dataSource: LoginRouterDataSource, dataDestination: LoginRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation

    func navigateToGroomerTabBarScene() {
        viewController.performSegue(withIdentifier: SegueIdentifiers.groomerTabBar, sender: viewController)
    }

    // MARK: Communication

    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
}
