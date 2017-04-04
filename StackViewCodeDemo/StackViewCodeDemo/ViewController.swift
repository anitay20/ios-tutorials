//
//  ViewController.swift
//  StackViewCodeDemo
//
//  Created by anita on 10/25/16.
//  Copyright © 2016 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Properties
    let colorDictionary = [
        "Red": UIColor.red,
        "Green": UIColor.green,
        "Blue": UIColor.blue
    ]
    

    // MARK: Instance Methods
    func colorButton(withColor color: UIColor, title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = color
        newButton.setTitle(title, for: .normal)
        return newButton
    }
    
    func displayKeyboard() {
        // generate an array of buttons
        var buttonArray = [UIButton]()
        for (myKey, myValue) in colorDictionary {
            buttonArray += [colorButton(withColor: myValue, title: myKey)]
        }
        
        self.view.backgroundColor = UIColor.yellow
        /*
        let stackView = UIStackView(arrangedSubviews: buttonArray)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        */
        
        let subStackView = UIStackView(arrangedSubviews: buttonArray)
        subStackView.axis = .horizontal
        subStackView.distribution = .fillEqually
        subStackView.spacing = 5
        
        // set up a label
        let label = UILabel()
        label.text = "Color Chooser"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.textAlignment = .center
        
//        let blackButton = colorButton(withColor: UIColor.black, title: "Black")
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        
        let stackView = UIStackView(arrangedSubviews: [label, subStackView, imageView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
 
        // autolayout the stack view - pin 30 up, 20 left, 20 right
        let viewsDictionary = ["stackView" : stackView]
        let stackView_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[stackView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[stackView]-30-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        view.addConstraints(stackView_H)
        view.addConstraints(stackView_V)
        
    }
    

}

