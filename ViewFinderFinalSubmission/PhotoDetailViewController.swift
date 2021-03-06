//
//  PhotoDetailViewController.swift
//  ViewFinderFinalSubmission
//
//  Created by Corey  on 5/28/19.
//  Copyright © 2019 Corey Garcia. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    
    
    
    @IBOutlet weak var savedPhotoSelected: UIImageView!
    
    var photo: Photos? = nil
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let realPhoto = photo {
            title = realPhoto.caption
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    savedPhotoSelected.image = cellPhotoImage
                }
            }
        }
    }
}
