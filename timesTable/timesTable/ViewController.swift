//
//  ViewController.swift
//  timesTable
//
//  Created by Anita Yeung on 3/21/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var sliderValue: UISlider!
    @IBAction func numberSlider(sender: UISlider) {
        table.reloadData()
        number.text = "\(Int(sliderValue.value))"
    }

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var number: UILabel!

    
    func createArray(num: Int) -> [Int] {
        var ints = [Int]()
        
        for i in 1...num {
            ints.append(i)
        }
        return ints
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let timesTable = Int(sliderValue.value)
        cell.textLabel?.text = String(timesTable  * (indexPath.row + 1))
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

