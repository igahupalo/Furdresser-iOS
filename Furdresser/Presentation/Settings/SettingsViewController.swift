//
//  SettingsViewController.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol SettingsViewControllerInput {
    
}

protocol SettingsViewControllerOutput {
    func logOut()
}

class SettingsViewController: UIViewController, SettingsViewControllerInput {
    
    var output: SettingsViewControllerOutput?
    var router: SettingsRouter?
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SettingsConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Requests
    
    
    // MARK: Display logic
    
    @IBAction func didTapLogOutButton(_ sender: Any) {
        output?.logOut()
    }
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension SettingsViewController: SettingsPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}
