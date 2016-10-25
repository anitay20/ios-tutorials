//
//  ViewController.swift
//  UIPageViewControllerDemo
//
//  Created by anita on 10/21/16.
//  Copyright © 2016 anita. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDelegate {

    var arrPageTitle: NSArray = NSArray()
    var arrPagePhoto: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrPageTitle = ["Hello", "World", "First App!"]
        arrPagePhoto = ["hello.png", "world.png", "apps.png"]
        dataSource = self
        
        self.setViewControllers([UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIPageViewControllerDataSource {
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        index -= 1
        return
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    }
    
}
