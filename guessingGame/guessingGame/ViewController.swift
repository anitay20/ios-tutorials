//
//  ViewController.swift
//  guessingGame
//
//  Created by Anita Yeung on 3/2/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var computerGuess = Int(arc4random_uniform(6))
    var guesses = 0
    
    @IBOutlet weak var playerGuess: UITextField!
    @IBAction func guess(sender: UIButton) {
        performAction()
    }
    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        playerGuess.resignFirstResponder()
        performAction()
        return true
    }
    
    func performAction() {
        print("Computer guess is \(computerGuess)")
        if Int(playerGuess.text!) == computerGuess {
            results.text = "Good job!"
            image.image = UIImage(named: "like.png")
            computerGuess = Int(arc4random_uniform(6))
            guesses = 0
        } else {
            results.text = "Nope, it's not \(playerGuess.text!). Try again."
            image.image = UIImage(named: "dislike.png")
            guesses++
        }
        playerGuess.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.playerGuess.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

