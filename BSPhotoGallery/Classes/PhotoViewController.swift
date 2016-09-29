//
//  PhotoViewController.swift
//  PhotoGallery
//
//  Created by Bartłomiej Semańczyk on 27/09/2016.
//  Copyright © 2016 Railwaymen Sp. z.o.o. All rights reserved.
//

import UIKit

open class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    var index = 0
    
    private var imageSize: CGSize {
        return photoImageView.image?.size ?? .zero
    }
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = BSPhotoGallery.backgroundColor
        
        setupInitialView()
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    func updateContentMode() {
        setupInitialView()
    }
    
    //MARK: - Private
    
    private func setupInitialView() {
        
        photoImageView.sizeToFit()
        
        let imageViewSize = photoImageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.setZoomScale(scrollView.minimumZoomScale, animated: false)
        
        scrollViewDidZoom(scrollView)
    }
    
    //MARK: - Overridden
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 as DispatchTime) {
            self.setupInitialView()
        }
    }
    
    //MARK: - UIScrollViewDelegate
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
    
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
        let imageViewSize = photoImageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        if verticalPadding >= 0 {
            scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        } else {
            scrollView.contentSize = imageViewSize
        }
    }
}
