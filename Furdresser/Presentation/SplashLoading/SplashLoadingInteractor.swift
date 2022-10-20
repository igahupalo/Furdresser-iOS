//
//  SplashLoadingInteractor.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol SplashLoadingInteractorInput {
    
}

protocol SplashLoadingInteractorOutput {
    func navigateToGroomerTabBar()
    func navigateToManagerMain()
    func navigateToStart()
}

protocol SplashLoadingDataSource {
    
}

protocol SplashLoadingDataDestination {
    
}

class SplashLoadingInteractor: SplashLoadingInteractorInput, SplashLoadingDataSource, SplashLoadingDataDestination {
    
    var output: SplashLoadingInteractorOutput?
    var currentUser: User?

    private var authWorker = AuthWorker()

    // MARK: Business logic
    
    func fetchUser() {
        authWorker.fetchCurrentUser() { [weak self] user in
            self?.currentUser = user
            if let role = user?.role {
                switch role {
                case .groomer:
                    self?.output?.navigateToGroomerTabBar()
                case .manager:
                    self?.output?.navigateToManagerMain()
                }
            } else {
                self?.output?.navigateToStart()
            }
        }
    }
}