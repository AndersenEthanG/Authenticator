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
        FirebaseFunctions.fetchCurrentUserData { data in
            // Update outlets
            self.firstNameLabel.text = (data["firstName"] as! String)
            self.lastNameLabel.text = (data["lastName"] as! String)
            self.noteLabel.text = (data["note"] as? String)
        }
    } // End of Function fetch data
    
    
    @IBAction func photoBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Photo", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PhotoVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
} // End of Class
