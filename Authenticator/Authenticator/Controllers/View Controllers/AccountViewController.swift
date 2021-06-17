//
//  AccountViewController.swift
//  Authenticator
//
//  Created by Ethan Andersen on 6/15/21.
//

import UIKit

class AccountViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    // MARK: - Functions
    func updateView() {
        // Fetch data
        FirebaseFunctions.fetchData { data in
            // Update outlets
            self.firstNameLabel.text = (data["firstName"] as! String)
            self.lastNameLabel.text = (data["lastName"] as! String)
            self.noteLabel.text = (data["note"] as! String)
        }
    } // End of Function fetch data
    
    
    // MARK: - Actions
    @IBAction func fetchUsersBtn(_ sender: Any) {
        FirebaseFunctions.fetchUsers { data in
//            updateFriendTableViewCells(data)
            print(data)
        }
    } // End of Function fetch Users
    
    /*
    func updateFriendTableViewCells(data: [String]) {
        for i in infinity {
            firestore.fetch.collections where id = data[0]
            friend.firstna.text = i.firstName
        }
    }
    */
} // End of Class
