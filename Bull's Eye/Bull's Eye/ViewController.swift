//
//  ViewController.swift
//  Bull's Eye
//
//  Created by anita on 9/15/16.
//  Copyright © 2016 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var targetNum: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var scoreNum = 0
    var roundNum = 0

    
    @IBAction func tapMe(_ sender: AnyObject) {
        points = 100 - abs(targetValue - currentValue)
        let message = "The value of the slider is \(currentValue).\nThe target was \(targetValue).\nYou got \(points) points!"
        let alert = UIAlertController(title: "Test", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        roundNum += 1
        scoreNum += points
        round.text = "\(roundNum)"
//        slider.value = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        targetNum.text = "\(targetValue)"
        score.text = "\(scoreNum)"
        
    }

    
    @IBAction func startOver(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Start Over?", message: "Do you really want to start over? There's no turning back from this...", preferredStyle: .alert)
        let OKaction = UIAlertAction(title: "OK", style: .default, handler: { (action) in self.startNewRound() })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(OKaction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func startNewRound() {
        scoreNum = 0
        roundNum = 0
        currentValue = lroundf(slider.value)
        slider.value = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        targetNum.text = "\(targetValue)"
        score.text = "\(scoreNum)"
        round.text = "\(roundNum)"
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
        print("The value of the slider is now: \(currentValue)")
        
    }
    
    
}

