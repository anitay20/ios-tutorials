//
//  ViewController.swift
//  weatherForecast
//
//  Created by Anita Yeung on 3/30/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

var website = NSURL(string: "http://www.weather-forecast.com")

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var city: UITextField!
    @IBAction func submit(sender: UIButton!) {
        performAction()
    }

    @IBOutlet weak var weatherResult: UILabel!

    func performAction() {
        // Do any additional setup after loading the view, typically from a nib.
        var isSuccessful = false
        
        let attemptedUrl = NSURL(string: "http://www.weather-forecast.com" + "/locations/" + city.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if let url = attemptedUrl {
            website = url
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                if let urlContent = data {
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    let websiteArray = webContent!.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                    if websiteArray.count > 1 {
                        let weatherArray = websiteArray[1].componentsSeparatedByString("</span>")

                        if weatherArray.count > 1 {
                            let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                            isSuccessful = true

                            dispatch_async(dispatch_get_main_queue(), { ()  -> Void in
                                print("\(self.city.text)")
                                self.weatherResult.text = weatherSummary
                                self.weatherResult.textColor = UIColor.blackColor()
                            
                            })
                        }
                    }
                    
                } else {
                    print(error)
                }
                if isSuccessful == false {
                    self.weatherResult.text = "That is not a valid city. Please try again."
                    self.weatherResult.textColor = UIColor.redColor()
                    
                }
                
            }

        task.resume()
            
        } else {
            self.weatherResult.text = "That city is not valid."
            weatherResult.textColor = UIColor.redColor()
        }
    }
    
    
    @IBAction func seeWebsite(sender: UIButton) {
    
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        performAction()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.city.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
