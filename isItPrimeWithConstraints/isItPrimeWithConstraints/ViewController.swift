//
//  ViewController.swift
//  isItPrimeWithConstraints
//
//  Created by Anita Yeung on 3/9/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userInput: UITextField!
    @IBAction func submit(sender: UIButton) {
        performAction()
    }
    @IBOutlet weak var result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.userInput.delegate = self
    }
    
    func isPrime(num: Int) -> Bool {
        var isPrime = true
        if num > 2 {
            for var i = 2; i < num; i++ {
                if num % i == 0 {
                    isPrime = false
                }
            }
        }
        return isPrime
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        performAction()
        return false
    }
    
    func performAction() {
        if isPrime(Int(userInput.text!)!) {
            result.text = "\(userInput.text!) is a prime number"
        } else {
            result.text = "\(userInput.text!) is NOT a prime number"
        }
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

