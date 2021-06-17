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
    static func fetchData(🐶: @escaping ( [String : Any] ) -> Void) {
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
    
    static func fetchUsers(🐶: @escaping ( Any ) -> Void) {
        Firestore.firestore().collection("users").getDocuments { snapshot, 🛑 in
            if let 🛑 = 🛑 {
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
            }
            if let snapshot = snapshot {
                var users: [String] = []
                for document in snapshot.documents {
                    users.append(document.documentID)
                }
                🐶(users)
            }
        }
    } // End of FetchUsers Function
    
    
} // End of Class
