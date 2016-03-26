//
//  ViewController.swift
//  text
//
//  Created by Anita Yeung on 3/25/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var enteredText: UITextField!
    @IBOutlet weak var showText: UILabel!
    @IBAction func submitText(sender: UIButton!) {
        showText.text = enteredText.text
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.enteredText.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

