//
//  ViewController.swift
//  Bull's Eye
//
//  Created by anita on 9/15/16.
//  Copyright © 2016 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var scoreNum = 0
    var roundNum = 0

    
    @IBAction func tapMe(sender: AnyObject) {
        let message = "The value of the slider is \(currentValue)"
        let alert = UIAlertController(title: "Test", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        roundNum += 1
    }
    
    @IBOutlet weak var targetNum: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func startOver(sender: AnyObject) {
//        let alert = UIAlertController(title: "Start Over?", message: "Do you really want to start over? There's no turning back from this...", preferredStyle: .Alert)
//        let OKaction = UIAlertAction(title: "OK", style: .Default, handler: nil)
//        alert.addAction(OKaction)
//        presentViewController(alert, animated: true, completion: nil)
//        reset()
    }
    
    
    func reset() {
        scoreNum = 0
        roundNum = 0
        slider.value = 50
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
        
        print("The value of the slider is now: \(currentValue)")
        
    }
    
    
}

