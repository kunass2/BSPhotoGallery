//
//  ViewController.swift
//  BSPhotoGallery
//
//  Created by Bartłomiej Semańczyk on 09/27/2016.
//  Copyright (c) 2016 Bartłomiej Semańczyk. All rights reserved.
//

import UIKit
import BSPhotoGallery

class ViewController: UIViewController {
    
    private var images = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6"),
        UIImage(named: "7"),
        UIImage(named: "8")
    ]
    
    private var urls = [
        "https://mysoberroommate-stage.s3.amazonaws.com/uploads/room/photos/62/bea2a9ef-9cd6-469b-a82c-178bf35c506a.jpeg",
        "https://mysoberroommate-stage.s3.amazonaws.com/uploads/room/photos/62/a359197f-67ab-4058-81e0-5de6e1f99ed4.jpeg",
        "https://mysoberroommate-stage.s3.amazonaws.com/uploads/profile/photos/98/6f556adb-c5d8-40f2-b876-271cd52e7983.jpeg",
        "https://mysoberroommate-stage.s3.amazonaws.com/uploads/profile/photos/98/437f8d76-ae4d-4c7b-8476-2e38d3bbb4ac.jpeg",
        "https://mysoberroommate-stage.s3.amazonaws.com/uploads/profile/photos/98/9ea1f8de-29ae-4e5f-b4c4-b1554f44d943.jpeg"
    ]
    
    @IBAction func showGalleryButtonTapped(_ sender: UIButton) {
        
        let gallery = BSPhotoGallery(urls: urls).controller()
        present(gallery, animated: true)
    }
}
