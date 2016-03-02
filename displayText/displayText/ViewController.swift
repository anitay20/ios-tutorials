//
//  ViewController.swift
//  displayText
//
//  Created by Anita Yeung on 3/2/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBAction func submit(sender: UIButton) {
        performAction()
    }
    @IBAction func reset(sender: UIButton) {
        displayText.text = "Display Text"
        textField.text = nil
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        performAction()
        return true
    }
    
    func performAction() {
        displayText.text = textField.text
        textField.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

