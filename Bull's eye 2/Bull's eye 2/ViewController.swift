//
//  ViewController.swift
//  Bull's eye 2
//
//  Created by anita on 7/25/18.
//  Copyright © 2018 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundImage.image = UIImage(named: "background")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

