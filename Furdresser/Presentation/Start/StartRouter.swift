//
//  StartRouter.swift
//  Furdresser
//
//  Created by Iga Hupalo on 24/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol StartRouterInput {
    
}

protocol StartRouterDataSource: AnyObject {
    
}

protocol StartRouterDataDestination: AnyObject {
    
}

class StartRouter: StartRouterInput {
    
    weak var viewController: StartViewController!
    weak private var dataSource: StartRouterDataSource!
    weak var dataDestination: StartRouterDataDestination!
    
    init(viewController: StartViewController, dataSource: StartRouterDataSource, dataDestination: StartRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
    }
}
