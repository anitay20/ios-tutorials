//
//  webPageViewController.swift
//  weatherForecast
//
//  Created by Anita Yeung on 3/30/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class webPageViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(website)")
        webView.loadRequest(NSURLRequest(URL: website!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

