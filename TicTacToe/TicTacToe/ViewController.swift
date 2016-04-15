//
//  ViewController.swift
//  TicTacToe
//
//  Created by Anita Yeung on 3/31/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 // 1 = O, 2 = X
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombos = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                         [1, 4, 7], [2, 5, 8], [3, 6, 9],
                         [1, 5, 9], [3, 5, 7]]
    var gameActive = true


    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var gameOver: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func playAgain(sender: UIButton) {
        reset()
        print((gameState))
    }

    
    @IBAction func buttonPressed(sender: UIButton) {
        
        if (gameState[sender.tag-1] == 0 && gameActive == true) {
            gameState[sender.tag-1] = activePlayer
        
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "o"), forState: .Normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "x"), forState: .Normal)
                activePlayer = 1
            }
            print((gameState))
            
            for combo in winningCombos {
                
                if (gameState[combo[0]-1] != 0 && gameState[combo[0]-1] == gameState[combo[1]-1] && gameState[combo[1]-1] == gameState[combo[2]-1]) {
                    
                    gameActive = false
                    
                    if gameState[combo[0]-1] == 1 {
                        gameOver.text = "O won!"
                    } else {
                        gameOver.text = "X won!"
                    }
                    endGame()
                }
            }
            
            if gameActive {
                gameActive = false
                for buttonState in gameState {
                    if buttonState == 0 {
                    gameActive = true
                    }
                }
                if !gameActive {
                    gameOver.text = "It's a draw"
                    endGame()
                }
            }
            
        }
    }
    
    
    func endGame() {
        gameActive = false
        gameOver.hidden = false
        playAgain.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.gameOver.center = CGPointMake(self.gameOver.center.x + 500, self.gameOver.center.y)
            self.playAgain.center = CGPointMake(self.playAgain.center.x + 500, self.playAgain.center.y)
        })
    }

    func reset() {
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        print((gameState))
        
        var buttonToClear: UIButton
        for num in 1...9 {
            buttonToClear = self.view.viewWithTag(num) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
        gameOver.hidden = true
        gameOver.center = CGPointMake(gameOver.center.x - 500, gameOver.center.y)
        playAgain.hidden = true
        playAgain.center = CGPointMake(playAgain.center.x - 500, playAgain.center.y)
        
        gameActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOver.hidden = true
        gameOver.center = CGPointMake(gameOver.center.x - 500, gameOver.center.y)
        playAgain.hidden = true
        playAgain.center = CGPointMake(playAgain.center.x - 500, playAgain.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

