//
//  ViewController.swift
//  Animations
//
//  Created by Anita Yeung on 3/31/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var count = 1
    var timer = NSTimer()
    var isPaused = true
    
    @IBAction func action(sender: UIButton) {
        if isPaused {
            isPaused = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
            
        } else {
            timer.invalidate()
            isPaused = true
        }
    }
    
    func doAnimation() {
        if count == 37 {
            count = 1
        } else {
            count += 1
        }
        image.image = UIImage(named: "frame\(count)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

