//
//  MDCOutlinedTextField.swift
//  Furdresser
//
//  Created by Iga Hupalo on 31/03/2021.
//

import MaterialComponents.MaterialTextControls_OutlinedTextFields

public extension MDCOutlinedTextField {

    func setup(theme: TextFieldTheme = .white) {
        font = UIFont(name: "Nunito-Regular", size: 16)
        leadingAssistiveLabel.font = UIFont(name: "Nunito-Regular", size: 10)
        trailingAssistiveLabel.font = UIFont(name: "Nunito-Regular", size: 10)
        containerRadius = 5
        setColors(theme: theme)
    }

    func setupSecureEntryButton(theme: TextFieldTheme = .white) {
        let secureEntryButton = ImageToggleButton()
        secureEntryButton.setType(.secureEntry)
        let buttonSize = CGFloat(25)
        secureEntryButton.frame = CGRect(x: bounds.width - buttonSize,
                                        y: .zero,
                                        width: buttonSize,
                                        height: buttonSize)
        trailingView = secureEntryButton
        trailingViewMode = .always
        updateSecureEntryButtonImage()

        secureEntryButton.addTarget(self, action: #selector(toggleSecureEntry), for: .touchUpInside)
    }

    func setError(message: String) {
        leadingAssistiveLabel.text = message
        setColors(hasError: true)
    }

    func clearError(theme: TextFieldTheme = .white) {
        leadingAssistiveLabel.text = nil
        setColors(hasError: false)
    }

    func setHelperText(message: String) {
        leadingAssistiveLabel.text = message
    }

    func clearHelperText(message: String) {
        leadingAssistiveLabel.text = nil
    }

    // MARK: - Private

    @objc
    private func toggleSecureEntry() {
        isSecureTextEntry = !isSecureTextEntry
        updateSecureEntryButtonImage()
    }

    private func updateSecureEntryButtonImage() {
        (trailingView as? ToggleButton)?.toggle(isOn: isSecureTextEntry)
    }

    private func setColors(theme: TextFieldTheme = .white, hasError: Bool = false) {
        let controlStates: [MDCTextControlState] = [.normal, .editing, .disabled]
        tintColor = theme.tintColor

        controlStates.forEach {
            setTextColor(theme.textColor(for: $0), for: $0)
            setNormalLabelColor(theme.normalLabelColor(for: $0, hasError: hasError), for: $0)
            setFloatingLabelColor(theme.floatingLabelColor(for: $0, hasError: hasError), for: $0)
            setLeadingAssistiveLabelColor(theme.leadingAssistiveLabelColor(for: $0, hasError: hasError), for: $0)
            setOutlineColor(theme.outlineColor(for: $0, hasError: hasError), for: $0)
        }
    }
}
