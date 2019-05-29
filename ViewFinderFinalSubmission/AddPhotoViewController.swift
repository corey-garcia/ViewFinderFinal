//
//  AddPhotoViewController.swift
//  ViewFinderFinalSubmission
//
//  Created by Corey  on 5/27/19.
//  Copyright © 2019 Corey Garcia. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    //create a variable that holds the new screen which will be shown to the user of the app
    //here, the new screen which will be shown is the camera view which the user will use to take a photo
    var newScreen = UIImagePickerController()
    
    
    //controls what happens when user hits
    //the take photo button
    @IBAction func takePhoto(_ sender: UIButton) {
        newScreen.sourceType = .camera
        present(newScreen, animated: true, completion: nil)
    }
    
    //called when user taps Photo Library
    @IBAction func photoLibraryTapped(_ sender: UIButton) {
        newScreen.sourceType = .photoLibrary
        present(newScreen, animated: true, completion: nil)
    }
    
    //update screen with photo that the user has chosen
    
    @IBOutlet weak var newImage: UIImageView!
    
    //this changed to an internal func, ask Amy about this
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage.image = selectedImage
        }
    }
    
    @IBAction func hitPhotoSave(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            photoToSave.caption = captionText.text
            
            if let userImage = newImage.image {
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                }
            }
        }
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        navigationController?.popViewController(animated: true)
    }
    

    @IBOutlet weak var captionText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newScreen.delegate = self
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
