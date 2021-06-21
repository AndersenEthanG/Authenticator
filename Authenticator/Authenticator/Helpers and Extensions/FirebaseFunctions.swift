//
//  FirebaseFunctions.swift
//  Authenticator
//
//  Created by Ethan Andersen on 6/15/21.
//

import Foundation
import Firebase
import FirebaseUI

class FirebaseFunctions {
    
    static func createUser(email: String, password: String, firstName: String, lastName: String, note: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, 🛑 in
            // Check for errors
            if let 🛑 = 🛑 {
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
            } else {
                let data = [
                    "username" : username,
                    "firstName" : firstName,
                    "lastName" : lastName,
                    "uid" : result!.user.uid,
                    "note" : note
                ] as [String : Any]
                
                // This is the only real important line, adds the user, and sets their collection ID to their userID
                Firestore.firestore().collection("users").document((result!.user.uid)).setData(data) { 🛑 in
                    if let 🛑 = 🛑 {
                        print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
                    }
                }
            }
        } // End of Auth
    } // End of Create user Function
    
    
    // MARK: - Sign in
    static func signInUser(email: String, password: String, 🐶: @escaping (Result <Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, 🛑 in
            switch result {
            case .none:
                if let 🛑 = 🛑 {
                    print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
                    🐶(.failure(🛑))
                }
            case .some(_):
                🐶(.success(true))
            }
        } // End of Auth
    } // End of Function Sign In
    
    
    // MARK: - Fetch Data
    static func fetchCurrentUserData(🐶: @escaping ( [String : Any] ) -> Void) {
        // Get current user UID
        let uid = Auth.auth().currentUser?.uid
        // Fetch data
        let userData = Firestore.firestore().collection("users").document(uid!)
        userData.getDocument { ( document, 🛑 ) in
            if let 🛑 = 🛑 {
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
            } else {
                // dataInfo is the user information
                🐶(document!.data()!)
            }
        } // End of getDocument
    } // End of Function fetchData
    
    static func fetchUsers(🐶: @escaping ( [String] ) -> Void) {
        Firestore.firestore().collection("users").getDocuments { snapshot, 🛑 in
            if let 🛑 = 🛑 {
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
                return 🐶([])
            }
            if let snapshot = snapshot {
                var userIds: [String] = []
                for document in snapshot.documents {
                    userIds.append(document.documentID)
                }
                var usersNames: [String] = []
                let group = DispatchGroup()
                
                for i in userIds {
                    group.enter()
                    FirebaseFunctions.fetchUserData(uid: i) { data in
                        // Data to return
                        let firstName: String = data["firstName"] as! String
                        let lastName: String = data["lastName"] as! String
                        usersNames.append(firstName + " " + lastName)
                        group.leave()
                    }
                } // End of Loop
                group.notify(queue: DispatchQueue.main) {
                    🐶(usersNames)
                }
            } // End of Snapshot
        }
    } // End of FetchUsers Function

    static func fetchUserData(uid: String ,🐶: @escaping ( [String : Any] ) -> Void) {
        // Get current user UID
        let uid = uid
        // Fetch data
        let userData = Firestore.firestore().collection("users").document(uid)
        userData.getDocument { ( document, 🛑 ) in
            if let 🛑 = 🛑 {
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
            } else {
                // dataInfo is the user information
                🐶(document!.data()!)
            }
        } // End of getDocument
    } // End of Function fetchData
    
} // End of Class
