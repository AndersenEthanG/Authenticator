//
//  Photo.swift
//  Authenticator
//
//  Created by Ethan Andersen on 6/29/21.
//

import Foundation

class Photo {
    
    var title: String
    var creator: String
    var imageURL: URL
    
    init(title: String, creator: String, imageURL: URL) {
        self.title = title
        self.creator = creator
        self.imageURL = imageURL
    }
    
} // End of Class Photo
