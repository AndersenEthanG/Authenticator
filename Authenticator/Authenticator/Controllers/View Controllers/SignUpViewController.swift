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
        if validateFields() == true {
            // Create user via Firebase
            //            FirebaseFunctions.createUser(email: emailField.text!, password: passwordField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, note: noteField.text!, username: usernameField.text!)
            print("User \(usernameField.text ?? "") created!")
            // Pop view
            navigationController?.popViewController(animated: true)
        } else {
            print("Error in \(#function)\(#line)")
        }
    } // End of Action
    
    
    // MARK: - Functions
    func validateFields() -> Bool {
        // Check if all fields are filled in
        if (usernameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                confirmPasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                noteField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") ||
            // This will make sure that both passwords are the same
            (passwordField.text != passwordField.text) ||
            // Thich checks password length
            (usernameField.text!.count < 16) {
            print("Please fill out all fields")
        } else { return false }
        // This doesn't seem to work
        if PasswordValidator.passwordValid(passwordField.text!) == false {
            // TODO display alert
            print("Password must have one capital letter, one number, one symbol, and be between 6 and 16 characters")
            return false
        }
        return true
    } // End of Function
    
} // End of Class
