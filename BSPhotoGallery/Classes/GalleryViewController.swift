//
//  GalleryViewController.swift
//  BSPhotoGallery
//
//  Created by Bartłomiej Semańczyk on 17/06/16.
//  Copyright © 2016 Railwaymen Sp. z.o.o. All rights reserved.
//

import UIKit
import SDWebImage

enum Method {
    
    case image
    case string
}

open class GalleryViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private var pageViewController: UIPageViewController!
    
    var images = [UIImage?]() {
        
        didSet {
            setInitialController()
        }
    }
    
    var urls = [String]() {
        
        didSet {
            setInitialController()
        }
    }
    
    var currentPhotoViewControllerIndex = 0
    var method = Method.image
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        
        view.backgroundColor = BSPhotoGallery.backgroundColor
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func viewSwipedDown(_ sender: UISwipeGestureRecognizer) {
        
        if navigationController == nil {
            dismiss(animated: true)
        }
    }
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private func setInitialController() {
        
        if let controller = controller(at: currentPhotoViewControllerIndex) {
            pageViewController.setViewControllers([controller], direction: .reverse, animated: true)
        }
    }
    
    private func controller(at index: Int) -> PhotoViewController? {
        
        var count = 0
        
        if case .image = method {
            
            count = images.count
            
        } else if case .string = method {
            
            count = urls.count
        }
        
        if case 0..<count = index {
            
            let photoViewController = UINib(nibName: "PhotoViewController", bundle: Bundle(for: PhotoViewController.classForCoder())).instantiate(withOwner: nil, options: nil).first as! PhotoViewController
            
            photoViewController.index = index
            
            if case .image = method {
                
                photoViewController.photoImageView.image = images[index]
                photoViewController.updateContentMode()
                
            } else if case .string = method {
                
                if let url = URL(string: urls[index]) {
                    
                    photoViewController.photoImageView.sd_setImage(with: url) { (image, _, _, _) in
                        photoViewController.updateContentMode()
                    }
                }
            }
            
            return photoViewController
        }
        
        return nil
    }
    
    //MARK: - Overridden
    
    //MARK: - UIPageViewControllerDataSource
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return controller(at: (viewController as! PhotoViewController).index - 1)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return controller(at: (viewController as! PhotoViewController).index + 1)
    }
    
    //MARK: - UIPageViewControllerDelegate
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let photoViewController = pageViewController.viewControllers?.last as? PhotoViewController, completed {
            currentPhotoViewControllerIndex = photoViewController.index
        }
    }
}
