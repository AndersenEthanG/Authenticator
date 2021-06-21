//
//  UserTableViewCell.swift
//  Authenticator
//
//  Created by Ethan Andersen on 6/18/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }

    // MARK: - Properties
    // Our source of truth
    var user: String = ""
    
    
    // MARK: - Functions
    func updateView() {
        fetchUser()
        print("loading Users!")
        print(user)
        
        firstNameLabel.text = "Test"
        lastNameLabel.text = "Test"
    } // End of Function updateView
    
    // MARK: - Actions
    
    @IBAction func addFriendsBtn(_ sender: Any) {
        // Add this user to the logedInUser's friends array
    }
    
    func fetchUser() {
        // Using the
    }
    
} // End of Class
