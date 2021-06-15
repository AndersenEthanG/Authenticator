//
//  SignUpViewController.swift
//  Authenticator
//
//  Created by Ethan Andersen on 6/15/21.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var noteField: UITextField!

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    } // End of Function
    
    
    // MARK: - Actions
    @IBAction func signUpBtn(_ sender: Any) {
        // Validate fields
        let error = validateFields()
        if error != nil {
            print("Error in \(#function)\(#line)")
        }
        // Create user via Firebase
        FirebaseFunctions.createUser(email: emailField.text!, password: passwordField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, note: noteField.text!)
        print("User \(usernameField.text ?? "") created!")
        // Pop view
        navigationController?.popViewController(animated: true)
    } // End of Function

    
    // MARK: - Functions
    func validateFields() -> String? {
        // This is just if they are empty
        // Checking for spaces would require a .trimmingCharacters, including whitespaces and new lines
        if usernameField.text != "" ||
        emailField.text != "" ||
        passwordField.text != "" ||
        confirmPasswordField.text != "" ||
        firstNameField.text != "" ||
        lastNameField.text != "" ||
            noteField.text != "" {
            print("Please fill out all fields")
        }
//        if PasswordValidator.passwordValid(passwordField.text!) == false {
//            print("Password using illegal characters!")
//    }
        return nil
    } // End of Function
    
} // End of Class
