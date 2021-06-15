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
    
    static func createUser(email: String, password: String, firstName: String, lastName: String, note: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, 🛑 in
            // Check for errors
            if let 🛑 = 🛑 {
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
            } else {
                let data = [
                    "firstName" : firstName,
                    "lastName" : lastName,
                    "uid" : result!.user.uid,
                    "note" : note
                ] as [String : Any]
                
                // This is the only real important line, adds the users
                Firestore.firestore().collection("users").addDocument(data: data) { 🛑 in
                    if let 🛑 = 🛑 {
                        print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
                    }
                }
            }
        } // End of Auth
    } // End of Create user Function
    
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
    
} // End of Class
