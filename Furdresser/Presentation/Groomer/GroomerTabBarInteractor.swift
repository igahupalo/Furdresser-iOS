//
//  GroomerTabBarInteractor.swift
//  Furdresser
//
//  Created by Iga Hupalo on 24/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol GroomerTabBarInteractorInput {
    
}

protocol GroomerTabBarInteractorOutput {
    
}

protocol GroomerTabBarDataSource {
    
}

protocol GroomerTabBarDataDestination {
    
}

class GroomerTabBarInteractor: GroomerTabBarInteractorInput, GroomerTabBarDataSource, GroomerTabBarDataDestination {
    
    var output: GroomerTabBarInteractorOutput?

    var currentUser: User?
    
    // MARK: Business logic
}