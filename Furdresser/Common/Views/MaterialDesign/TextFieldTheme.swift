//
//  TextFieldTheme.swift
//  Furdresser
//
//  Created by Iga Hupalo on 31/03/2021.
//

import MaterialComponents.MaterialTextControls_OutlinedTextFields

public enum TextFieldTheme {
    case white
    
    var tintColor: UIColor {
        switch self {
        case .white:
            return .white
        }
    }
    
    func textColor(for state: MDCTextControlState, hasError: Bool = false) -> UIColor {
        switch state {
        case .normal:
            switch self {
            case .white:
                return .white
            }
        case .editing:
            switch self {
            case .white:
                return .white
            }
        case .disabled:
            switch self {
            case .white:
                return .init(white: 1, alpha: 0.5)
            }
        @unknown default:
            return .white
        }
    }

    func outlineColor(for state: MDCTextControlState, hasError: Bool = false) -> UIColor {
        switch state {
        case .normal:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        case .editing:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        case .disabled:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        @unknown default:
            return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
        }
    }
    
    func normalLabelColor(for state: MDCTextControlState, hasError: Bool = false) -> UIColor {
        switch state {
        case .normal:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        case .editing:
            switch self {
            case .white:
                return !hasError ? .white :UIColor(named: "ErrorPrimary") ?? .yellow
            }
        case .disabled:
            switch self {
            case .white:
                return !hasError ? .init(white: 1, alpha: 0.5) : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        @unknown default:
            return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
        }
    }
    
    func floatingLabelColor(for state: MDCTextControlState, hasError: Bool = false) -> UIColor {
        switch state {
        case .normal:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        case .editing:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        case .disabled:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        @unknown default:
            return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
        }
    }
    
    func leadingAssistiveLabelColor(for state: MDCTextControlState, hasError: Bool = false) -> UIColor {
        switch state {
        case .normal:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        case .editing:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        case .disabled:
            switch self {
            case .white:
                return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
            }
        @unknown default:
            return !hasError ? .white : UIColor(named: "ErrorPrimary") ?? .yellow
        }
    }
}
