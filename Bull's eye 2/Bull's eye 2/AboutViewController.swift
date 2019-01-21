//
//  AboutViewController.swift
//  Bull's eye 2
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutText: UITextView!
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearances()
    }

    func setupAppearances() {
        aboutText.font = UIFont(name: "System", size: 14.0)
        aboutText.isEditable = false
        aboutText.textColor = .black
        aboutText.text = """
        Bull's Eye
        
        Slide to the target value.
        Press on Hit Me! to guess
        """
        
        closeButton.backgroundColor = .cyan
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        
    }
    
    
}
