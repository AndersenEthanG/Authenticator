//
//  UsersTableViewController.swift
//  Authenticator
//
//  Created by Ethan Andersen on 6/18/21.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchUsers()
    } // End of View did Load
    
    
    // MARK: - Properties
    var usersNames: [String] = []
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersNames.count
    } // End of Row count
    
    // Table Cell Data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let user = self.usersNames[indexPath.row]
        
        cell.textLabel?.text = user
        
        return cell
    } // End of Table View Update
    
    
    // MARK: - Functions
    func fetchUsers() {
        FirebaseFunctions.fetchUsers { usersNames in
            self.usersNames = usersNames
            self.tableView.reloadData()
        }
    } // End of Function fetch users
    
} // End of Class
