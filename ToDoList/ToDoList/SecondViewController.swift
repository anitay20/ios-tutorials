//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Anita Yeung on 3/25/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addText: UILabel!
    @IBOutlet weak var enterText: UITextField!
    @IBAction func addItemButton(sender: AnyObject) {
        performAction()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        enterText.resignFirstResponder()
        performAction()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func performAction() {
        if enterText.text != "" {
            toDoList.append(enterText.text!)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            enterText.text = ""   // Reset the textField
        }
        print("\(toDoList)")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.enterText.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

