//
//  ViewController.swift
//  Bull's eye 2
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBAction func resetButton(_ sender: UIButton) {
        let title = "Reset"
        let message = "Are you sure you want to reset the game?"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            self.resetGame()
        })
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet weak var hitMeButton: UIButton!
    @IBAction func hitMeButton(_ sender: UIButton) {
        let difference = abs(target - currentValue)
        var points = 100 - difference
        print("Target is \(target)")
        print("currentValue is \(currentValue)")
        print("Points: \(points)")
        
        let title: String
        var buttonTitle: String = "OK"
        switch difference {
        case 0:
            title = "Perfect"
            points += 100
            buttonTitle = "Awesome!"
        case 1...5:
            title = "Almost there"
            if difference == 1 {
                points += 50
            }
        case 6...10:
            title = "Close but not that close"
        default:
            title = "Way off...."
        }
        
        let message = """
        The target value is \(target).
        The current value is \(currentValue).
        You scored \(points) points.
        """
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: {
            action in
            self.calculateScore()
            self.startNextRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBAction func movedSlider(_ slider: UISlider) {
        currentValue = Int(slider.value.rounded())
        print("currentValue: \(currentValue)")
    }
    @IBOutlet weak var slider: UISlider!
    
    var target = Int.random(in: 1...100)
    var score: Int = 0
    var numRound: Int = 0
    var currentValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpAppearances()
        currentValue = Int(slider.value.rounded())
        resetGame()
    }

    func setUpAppearances() {
        backgroundImage?.image = UIImage(named: "background")
        directionLabel.text = "Put the Bull's Eye as close as you can to: "
        
        hitMeButton.backgroundColor = .blue
        hitMeButton.setTitleColor(.white, for: .normal)
        hitMeButton.layer.cornerRadius = 5
        
        
    }
    
    func updateLabels() {
        num.text = "\(target)"
        scoreLabel.text = "Score: \(score)"
        roundLabel.text = "Round: \(numRound)"
    }
    
    func calculateScore() {
        if currentValue == target {
            score += 200
        } else {
            score += (100 - abs(target - currentValue))
        }
    }
    
    func resetGame() {
        numRound = 0
        score = 0
        startNextRound()
        updateLabels()
    }

    func startNextRound() {
        numRound += 1
        target = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        print("Score is \(score)")
        updateLabels()
    }
}
