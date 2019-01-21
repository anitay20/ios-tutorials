//
//  ViewController.swift
//  concentration
//
//  Created by anita on 1/19/19.
//  Copyright © 2019 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    let emojiChoices = ["🦷", "👮‍♂️", "🦷", "👮‍♂️"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }

    func flipCard(withEmoji emoji: String, on button: UIButton) {
        flipCount += 1
        flipCountLabel.text = "Flips: \(flipCount)"
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}

