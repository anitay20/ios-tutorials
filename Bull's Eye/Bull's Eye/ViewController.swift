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
    var scoreNum = 0
    var roundNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func tapMe(sender: AnyObject) {
        points = 100 - abs(targetValue - currentValue)
        let message = "The value of the slider is \(currentValue).\nThe target was \(targetValue).\nYou got \(points) points!"
        let alert = UIAlertController(title: "Test", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound(points: points)
    }

    
    @IBAction func startOver(sender: AnyObject) {
        let alert = UIAlertController(title: "Start over?", message: "Do you really want to start over? There's no turning back from this...", preferredStyle: .alert)
        let OKaction = UIAlertAction(title: "OK", style: .default, handler: { (action) in self.startNewGame() })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(OKaction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func startNewGame() {
        scoreNum = 0
        roundNum = 1
        currentValue = lroundf(slider.value)
        slider.value = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        updateLabels()
    }
    
    func startNewRound(points: Int) {
        scoreNum += points
        roundNum += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        updateLabels()
    }
    
    func updateLabels() {
        targetNum.text = "\(targetValue)"
        score.text = "\(scoreNum)"
        round.text = "\(roundNum)"
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
        print("The value of the slider is now: \(currentValue)")
        
    }
    
    @IBAction func info(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Rules", message: "These are the rules of the game:\nTry to guess where the target number\nis on the slider", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

