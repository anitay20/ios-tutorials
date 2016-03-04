//
//  ViewController.swift
//  isItPrime?
//
//  Created by Anita Yeung on 3/2/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBAction func submit(sender: UIButton) {
//        number.resignFirstResponder()
        performAction()
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
    
    func textFieldShouldReturn(number: UITextField) -> Bool {
        number.resignFirstResponder()
        performAction()
        return true
    }
    
    func performAction() {
        if isPrime(Int(number.text!)!) {
            result.text = "\(number.text!) is a prime number"
        } else {
            result.text = "\(number.text!) is NOT a prime number"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.number.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

