//
//  LoginInteractor.swift
//  Furdresser
//
//  Created by Iga Hupalo on 24/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol LoginInteractorInput {
    
}

protocol LoginInteractorOutput {
    func setEmailError(message: String?)
    func setPasswordError(message: String?)
}

protocol LoginDataSource {
    
}

protocol LoginDataDestination {
    
}

class LoginInteractor: LoginInteractorInput, LoginDataSource, LoginDataDestination {
    
    var output: LoginInteractorOutput?
    
    private var authWorker = AuthWorker()
    private var isValidEmail = true
    private var isValidPassword = true
    
    // MARK: Business logic

    func validateEmail(request: ValidateEmail.Request) {
        let result = authWorker.isValidEmail(email: request.email)
        var message: String
        switch result {
        case .invalid:
            message = NSLocalizedString("invalid-email", comment: "")
        case .empty:
            message = NSLocalizedString("empty-email", comment: "")
        default:
            return
        }
        output?.setEmailError(message: message)
    }

    func validatePassword(request: ValidatePassword.Request) {
        let result = authWorker.isValidPassword(password: request.password)
        var message: String
        switch result {
        case .empty:
            message = NSLocalizedString("empty-password", comment: "")
        default:
            return
        }
        output?.setPasswordError(message: message)
    }

    func logIn(request: LogIn.Request) {
        authWorker.logIn(email: request.email, password: request.password) { [weak self] errorCode in
            if errorCode == nil {
                print("User logged in successfully.")
            } else {
                switch errorCode! {
                case .wrongPassword:
                    let message = NSLocalizedString("incorrect-email-password", comment: "")
                    self?.output?.setEmailError(message: message)
                    self?.output?.setPasswordError(message: message)
                case .otherError:
                    print("Other error: \(errorCode!)")
                }
            }
        }
    }
}

private extension LoginInteractor {

}
