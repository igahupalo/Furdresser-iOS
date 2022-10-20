//
//  SettingsRouter.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol SettingsRouterInput {
    
}

protocol SettingsRouterDataSource: AnyObject {
    
}

protocol SettingsRouterDataDestination: AnyObject {
    
}

class SettingsRouter: SettingsRouterInput {
    
    weak var viewController: SettingsViewController!
    weak private var dataSource: SettingsRouterDataSource!
    weak var dataDestination: SettingsRouterDataDestination!
    
    init(viewController: SettingsViewController, dataSource: SettingsRouterDataSource, dataDestination: SettingsRouterDataDestination) {
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
