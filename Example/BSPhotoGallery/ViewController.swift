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
    
    @IBAction func showGalleryButtonTapped(_ sender: UIButton) {
        
        let gallery = BSPhotoGallery(images: images).controller()
        present(gallery, animated: true)
    }
}
