//
//  SplashLoadingPresenter.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol SplashLoadingPresenterInput {
    
}

protocol SplashLoadingPresenterOutput: AnyObject {
    func navigateToGroomerTabBar()
    func navigateToManagerTabBar()
    func navigateToStart()
}

class SplashLoadingPresenter: SplashLoadingPresenterInput {
    
    weak var output: SplashLoadingPresenterOutput?
    
    // MARK: Presentation logic

    func navigateToStart() {
        output?.navigateToStart()
    }

    func navigateToGroomerTabBar() {
        output?.navigateToGroomerTabBar()
    }

    func navigateToManagerMain() {
        output?.navigateToManagerTabBar()
    }
}
