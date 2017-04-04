//
//  TutorialPageViewController.swift
//  UIPageViewController
//
//  Created by anita on 10/16/16.
//  Copyright © 2016 anita. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    
    var orderedViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        // Do any additional setup after loading the view.
        
        orderedViewControllers = [self.newColoredViewController(color: "Green"),
                                  self.newColoredViewController(color: "Red"),
                                  self.newColoredViewController(color: "Blue")]
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

}

// MARK: UIPageViewControllerDataSource

extension TutorialPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        NSLog("Previous Index is: \(previousIndex)")
        
        guard previousIndex >= 0 else {
            return nil
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        NSLog("Next Index is: \(nextIndex)")
        
        let orderedViewControllersCount = orderedViewControllers.count
        NSLog("\(orderedViewControllersCount)")
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
    func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(withIdentifier: "\(color)ViewController")
    }
    
}
