//
//  PhotoTableViewController.swift
//  Authenticator
//
//  Created by Ethan Andersen on 6/29/21.
//

import UIKit
import FirebaseStorage

// Add these two delegates for photo stuff
class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var imageTitleField: UITextField!
    @IBOutlet weak var creatorNameField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { 📀, _, 🛑 in
            guard let 📀 = 📀, 🛑 == nil else {
                print("Error in \(#function)\(#line)")
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: 📀)
                self.imageView.image = image
            } // End of Dispatch Queue
        })
        task.resume()
        
        updateView()
    }

    // MARK: - Properties
    var photo: Photo?
    
    // Firebase storage stuff
    private let storage = Storage.storage().reference()
    
    // MARK: - Actions
    
    // Image Picker Controller is how we open that built in Apple photo picker
    @IBAction func pickPhotoBtn(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
    }
    
    // MARK: - Functions
    func fetchData() {
        
    }
    
    func updateView() {
        imageTitleField.text = ""
        creatorNameField.text = ""
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
        // Grab the image as an image
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        // Grab image data
        guard let imageData = image.pngData() else { return }
        guard let title = imageTitleField.text else { return }
        guard let creator = creatorNameField.text else { return }
        
        // This is the Firebase save stuff
        // This is where you set the file name, this should be random or something I guess
        let ref = storage.child("images/file.png")
        // This is the Firebase command bit to actually store things
        ref.putData(imageData, metadata: nil, completion: { _, 🛑 in
            // Error handling
            if let 🛑 = 🛑 {
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
                return
            }
            // Download a url
            ref.downloadURL(completion: { url, 🛑 in
                if let 🛑 = 🛑 {
                    print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
                }
                let urlString = url?.absoluteURL
                print("Download URL: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            }) // End of Download URL
        }) // End of Firebase stuff
    } // End of Function
    
    // When the user clicks away
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    } // End of Function

} // End of Class Photo Table VC
