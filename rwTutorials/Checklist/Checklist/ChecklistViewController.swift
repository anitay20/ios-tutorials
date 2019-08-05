//
//  ViewController.swift
//  Checklist
//

import UIKit

class ChecklistViewController: UITableViewController {

    var row0Item: ChecklistItem
    
    required init?(coder aDecoder: NSCoder) {
        row0Item = ChecklistItem()
        row0Item.text = "Take a jog"
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

        if let label = cell.viewWithTag(1000) as? UILabel {
            switch indexPath.row % 5 {
            case 0:
                label.text = "Take a jog"
            case 1:
                label.text = "Watch a movie"
            case 2:
                label.text = "Code an app"
            case 3:
                label.text = "Walk the dog"
            case 4:
                label.text = "Study design patterns"
            default:
                label.text = "hello"
            }
//            label.text = indexPath.row == 0 ? "Run a marathon" : "Sleep"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        
    }
    
}
