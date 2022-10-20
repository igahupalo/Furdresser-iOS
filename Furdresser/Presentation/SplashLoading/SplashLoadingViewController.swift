//
//  SplashLoadingViewController.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol SplashLoadingViewControllerInput {
    
}

protocol SplashLoadingViewControllerOutput {
    func fetchUser()
}

class SplashLoadingViewController: UIViewController, SplashLoadingViewControllerInput {
    
    var output: SplashLoadingViewControllerOutput?
    var router: SplashLoadingRouter?
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SplashLoadingConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.fetchUser()
    }
    
    // MARK: Requests
    
    
    // MARK: Display logic
    func navigateToStart() {
        router?.navigateToStart()
    }

    func navigateToGroomerTabBar() {
        router?.navigateToGroomerTabBar()
    }

    func navigateToManagerTabBar() {
        router?.navigateToManagerTabBar()
    }
}

private extension SplashLoadingViewController {
    func setupBackground() {
        let primaryColor = (UIColor(named: "Primary") ?? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).cgColor
        let primaryDarkColor = (UIColor(named: "PrimaryDark") ?? #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)).cgColor

        view.applyGradient(colors: [primaryDarkColor, primaryColor], angle: 0.7)
    }
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension SplashLoadingViewController: SplashLoadingPresenterOutput {


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}
