//
//  ViewController.swift
//  TicTacToe
//
//  Created by Anita Yeung on 3/31/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // 1 = x, 2 = o
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                         [0, 3, 6], [1, 4, 7], [2, 5, 8],
                         [0, 4, 8], [2, 4, 6]]
    var gameActive = true


    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var gameOver: UILabel!
    @IBAction func playAgain(sender: UIButton) {
        reset()
    }
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "o"), forState: .Normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "x"), forState: .Normal)
                activePlayer = 1
            }
        
            for combo in winningCombos {
                if (gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combo[0]] == 1 {
                        print("O won!")
                        gameOver.text = "O won!"
                    } else {
                        print("X won!")
                        gameOver.text = "X won!"
                    }
                    gameOver.hidden = false
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOver.center = CGPointMake(self.gameOver.center.x + 500, self.gameOver.center.y)
                        self.playAgain.center = CGPointMake(self.playAgain.center.x + 500, self.playAgain.center.y)
                        
                    })
                    
                    
                }
            }
        }
        
        
    }
    
    func reset() {
        activePlayer = 1
        for state in gameState{
            gameState[state] = 0
        }
        
        var buttonToClear: UIButton
        for num in 0...9 {
            buttonToClear = self.view.viewWithTag(num) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
        gameOver.hidden = true
        gameOver.center = CGPointMake(gameOver.center.x - 500, gameOver.center.y)
        playAgain.hidden = true
        playAgain.center = CGPointMake(playAgain.center.x - 500, playAgain.center.y)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOver.hidden = true
        gameOver.center = CGPointMake(gameOver.center.x - 500, gameOver.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

