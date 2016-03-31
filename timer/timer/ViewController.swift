//
//  ViewController.swift
//  timer
//
//  Created by Anita Yeung on 3/12/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var timer = NSTimer()
    
    @IBOutlet weak var time: UILabel!
    
    @IBAction func start(sender: UIBarButtonItem) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(result), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pause(sender: UIBarButtonItem) {
        timer.invalidate()
        
    }
    
    @IBAction func stop(sender: UIBarButtonItem) {
        timer.invalidate()
        reset()
    }
    
    func reset() {
        timer.invalidate()
        count = 0
        time.text = "\(count)"
    }
    
    func result() {
        count += 1
        time.text = String(count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

