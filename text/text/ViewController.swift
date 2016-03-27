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
        NSUserDefaults.standardUserDefaults().setObject(showText.text, forKey: "text")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("text") != nil {
            showText.text = NSUserDefaults.standardUserDefaults().objectForKey("text") as? String
        }
        
        self.enteredText.delegate = self
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

