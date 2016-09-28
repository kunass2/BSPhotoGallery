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
    
    private lazy var galleryViewController: GalleryViewController = {
        return UINib(nibName: "GalleryViewController", bundle: Bundle(for: GalleryViewController.classForCoder())).instantiate(withOwner: nil, options: nil).first as! GalleryViewController
    }()
    
    public init(images: [UIImage?], currentIndex: Int = 0) {
        
        galleryViewController.currentPhotoViewControllerIndex = currentIndex
        galleryViewController.method = .image
        galleryViewController.images = images
    }
    
    public init(urls: [String], currentIndex: Int = 0) {
        
        galleryViewController = UINib(nibName: "GalleryViewController", bundle: Bundle(for: GalleryViewController.classForCoder())).instantiate(withOwner: nil, options: nil).first as! GalleryViewController
        
        galleryViewController.currentPhotoViewControllerIndex = currentIndex
        galleryViewController.method = .string
        galleryViewController.urls = urls
    }
    
    open func controller() -> GalleryViewController {
        return galleryViewController
    }
}
