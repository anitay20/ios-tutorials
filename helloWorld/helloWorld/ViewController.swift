//
//  ViewController.swift
//  helloWorld
//
//  Created by anita on 9/12/16.
//  Copyright © 2016 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func hitMe() {
    let alert = UIAlertController(title: "Hello World", message: "This is the first app", preferredStyle: .Alert)
        
    let action = UIAlertAction(title: "Awesome", style: .Default, handler: nil)
        
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
    }

}

    