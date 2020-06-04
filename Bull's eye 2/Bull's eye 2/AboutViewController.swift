//
//  AboutViewController.swift
//  Bull's eye 2
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        setupAppearances()
    }
    
    
    
    func setupAppearances() {
//        aboutText.font = UIFont(name: "Arial Rounded MT Bold", size: 17.0)
//        aboutText.isEditable = false
//        aboutText.textColor = .white
//        aboutText.text = """
//        *** Bull's Eye ***
//
//        Welcome to the awesome game of Bull's Eye where you can win points and fame by dragging a slider.
//
//        Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score. Enjoy!
//        """
        
        closeButton.setTitle("Close", for: .normal)
        let buttonTextColor = UIColor(red: 0.45, green: 0.16, blue: 0.00, alpha: 1.00)
        closeButton.setTitleColor(buttonTextColor, for: .normal)
    }
    
}
