//
//  ViewController.swift
//  TestSFSafariViewController
//
//  Created by anita on 1/12/18.
//  Copyright © 2018 slice. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    @IBAction func goToYahooButton(_ sender: Any) {
        showYahooLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showYahooLogin() {
        let url = URL(string: "https://login.yahoo.com/")
        let viewController = SFSafariViewController(url: url!)
        present(viewController, animated: true, completion: nil)
    }
}

