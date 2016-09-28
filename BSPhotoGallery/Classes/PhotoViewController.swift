//
//  PhotoViewController.swift
//  PhotoGallery
//
//  Created by Bartłomiej Semańczyk on 27/09/2016.
//  Copyright © 2016 Railwaymen Sp. z.o.o. All rights reserved.
//

import UIKit

open class PhotoViewController: UIViewController {
    
    @IBOutlet var photoImageView: UIImageView!
    
    var index = 0
    
    private var imageSize: CGSize {
        return photoImageView.image?.size ?? .zero
    }
    
    //MARK: - Class Methods
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = BSPhotoGallery.backgroundColor
    }
    
    //MARK: - Initialization
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateContentMode(for: view.bounds.size)
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    func updateContentMode() {
        updateContentMode(for: view.bounds.size)
    }
    
    //MARK: - Private
    
    private func updateContentMode(for size: CGSize) {
        photoImageView.contentMode = size.width > imageSize.width && size.height > imageSize.height ? .center : .scaleAspectFit
    }
    
    //MARK: - Overridden
    
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateContentMode(for: size)
    }
}
