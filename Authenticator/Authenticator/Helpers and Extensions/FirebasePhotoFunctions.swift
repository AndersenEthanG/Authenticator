//
//  FirebasePhotoFunctions.swift
//  Authenticator
//
//  Created by Ethan Andersen on 6/29/21.
//
import FirebaseStorage

extension FirebaseFunctions {
    

    static func savePhoto(imageData: Data) {
        let storage = Storage.storage().reference()
        
        storage.child("images/file.png").putData(imageData, metadata: nil, completion: { _, 🛑 in
            if let 🛑 = 🛑 {
                print("Failed to upload")
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
            }
        })
    }

    static func fetchPhoto() {
        
    }
    
} // End of Extension
