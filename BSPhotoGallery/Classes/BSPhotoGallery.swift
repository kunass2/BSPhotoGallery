//
//  BSPhotoGallery.swift
//  Pods
//
//  Created by Bartłomiej Semańczyk on 27/09/2016.
//
//

import UIKit

open class BSPhotoGallery {
    
    open static var backgroundColor = UIColor.black
    
    private let galleryViewController: GalleryViewController!
    
    public init(images: [UIImage?], currentIndex: Int = 0) {
        
        galleryViewController = UINib(nibName: "GalleryViewController", bundle: Bundle(for: GalleryViewController.classForCoder())).instantiate(withOwner: nil, options: nil).first as! GalleryViewController
        
        galleryViewController.currentPhotoViewControllerIndex = currentIndex
        galleryViewController.images = images
    }
    
    open func controller() -> GalleryViewController {
        return galleryViewController
    }
}
