//
//  ViewController.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 18/12/24.
//  // Quote: Enjoy the programming

import UIKit

class ViewController: UIViewController, CounterDelegate {
    
    func increaseCount(_ count: Int) {
        countLable.text = String(count)
    }
        
    private let countLable: AppLabel = {
        let _appLable = AppLabel()
        _appLable.text = "0"
        _appLable.textColor = .gray
        _appLable.translatesAutoresizingMaskIntoConstraints = false
        return _appLable
    }()
    
    private let emailTextField: AppTextField = {
        let _appTextField = AppTextField()
        _appTextField.placeholder = "Email"
        _appTextField.translatesAutoresizingMaskIntoConstraints = false
        return _appTextField
    }()
    
    private let passwordTextField: AppTextField = {
        let _appTextField = AppTextField()
        _appTextField.placeholder = "Password"
        _appTextField.isSecureTextEntry = true
        _appTextField.translatesAutoresizingMaskIntoConstraints = false
        return _appTextField
    }()
    
    private let authenticateUserButton: AppButton = {
        let _appButton = AppButton()
        _appButton.setTitle("Authenticate User", for: .normal)
        _appButton.translatesAutoresizingMaskIntoConstraints = false
        return _appButton
    }()
    
    private let resetPasswordButton: AppButton = {
        let _appButton = AppButton()
        _appButton.setTitle("Reset Password", for: .normal)
        _appButton.setStyleState(.secondary)
        _appButton.translatesAutoresizingMaskIntoConstraints = false
        return _appButton
    }()
    
    private let buttonStackView: UIStackView = {
        let _stackView = UIStackView()
        _stackView.axis = .vertical
        _stackView.spacing = 10
        _stackView.translatesAutoresizingMaskIntoConstraints = false
        return _stackView
    }()
    
    private let spacerView: UIView = {
        let _spacer = UIView()
        _spacer.translatesAutoresizingMaskIntoConstraints = false
        return _spacer
    }()
    
    private let contactButton: AppButton = {
        let _appButton = AppButton()
        _appButton.setTitle("Contracts", for: .normal)
        _appButton.translatesAutoresizingMaskIntoConstraints = false
        _appButton.setStyleState(.secondary)
        return _appButton
    }()
    
    private let increaseCountButton: AppButton = {
        let _appButton = AppButton()
        _appButton.setTitle("Incrase Count", for: .normal)
        _appButton.translatesAutoresizingMaskIntoConstraints = false
        return _appButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Assing to the delegate
       
        PickerViewController.counterDelegate = self
        // Show loader to test it working or not
        Loader.show(on: view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Hide loader after 3 seconds
            Loader.hide()
            // Add the count label
            self.addCountLable()
            self.increaseCountButton.addTarget(self, action: #selector(self.onIncreaseCountButtonClick), for: .touchUpInside)
            // Add the stack view to the actual view
            self.addButtonToStackView()
            
            self.authenticateUserButton.isLoading = true
            self.resetPasswordButton.isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.authenticateUserButton.isLoading = false
                self.resetPasswordButton.isLoading = false
            }
            
            // Add the contact button
            self.addContactButton()
        }
    }
    
    private func addCountLable() {
        view.addSubview(countLable)
        NSLayoutConstraint.activate([
            countLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            countLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            countLable.heightAnchor.constraint(equalToConstant: 50),
            countLable.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    /// Prepare stack view and add the parent view
    private func addButtonToStackView() {
        // Add all the view to stackView vertically
        buttonStackView.addArrangedSubview(emailTextField)
        buttonStackView.addArrangedSubview(passwordTextField)
        buttonStackView.addArrangedSubview(spacerView)
        buttonStackView.addArrangedSubview(authenticateUserButton)
        buttonStackView.addArrangedSubview(resetPasswordButton)
//        buttonStackView.addArrangedSubview(increaseCountButton)
        
        // Add the stackView to the view
        view.addSubview(buttonStackView)
        
        // Set Constrainst of the stack view with the view controller view
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        // Set buttons height for both buttons using constraints
        authenticateUserButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        resetPasswordButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Add the height to space view
        spacerView.heightAnchor.constraint(equalToConstant: 30 - buttonStackView.spacing).isActive = true
    }
    
    private func addAuthenticateButton() {
        authenticateUserButton.addTarget(self, action: #selector(authenticateUser), for: .touchUpInside)
        view.addSubview(authenticateUserButton)
        NSLayoutConstraint.activate([
            authenticateUserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authenticateUserButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            authenticateUserButton.heightAnchor.constraint(equalToConstant: 50),
            authenticateUserButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    /// Prepare the contact button constraints
    private func addContactButton() {
        // Add the target on click of the contacts button
        contactButton.addTarget(self, action: #selector(openContactController), for: .touchUpInside)
        view.addSubview(contactButton)
        NSLayoutConstraint.activate([
            contactButton.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 30),
            contactButton.heightAnchor.constraint(equalToConstant: 50),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contactButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    @objc private func openContactController() {
        let _contractViewController = ImageViewController()
        self.navigationController?.pushViewController(_contractViewController, animated: true)
    }
    
    private func addResetPasswordButton() {
        view.addSubview(resetPasswordButton)
        NSLayoutConstraint.activate([
            resetPasswordButton.topAnchor.constraint(equalTo: authenticateUserButton.bottomAnchor, constant: 10),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 50),
            resetPasswordButton.widthAnchor.constraint(equalToConstant: 250),
            resetPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    /// Authenticate enter user field
    @objc private func authenticateUser() {
        
        if let emailText = emailTextField.text, emailText.isEmpty,
           let password = passwordTextField.text, password.isEmpty {
            AlertHandler.alert.alertWithOk(viewController: self, title: "Empty Field", message: "Please fill all the field.")
            return
        }
        
        // Validate email and password
        if emailTextField.text == "omkarshisode7@gmail.com" || passwordTextField.text == "Omkar_123" {
            // Open home screen
            navigateToAnotherViewController()
        } else {
            // On invalid password show error
            AlertHandler.alert.alertWithOk(viewController: self, title: "Invalid Credentials", message: "Please enter valid credentials")
            
        }
    }
    
    private func navigateToAnotherViewController() {
        
    }
    
    @objc private func onIncreaseCountButtonClick() {
    }
}

