//
//  PageContentViewController.swift
//  UIPageViewControllerDemo
//
//  Created by anita on 10/21/16.
//  Copyright © 2016 anita. All rights reserved.
//


import UIKit

class PageContentViewController: UIViewController {
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int = 0
    var strTitle: String!
    var strPhotoName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: strPhotoName)
        pageTitle.text = strTitle
    }
}
