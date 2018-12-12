//
//  ViewController.swift
//  CoffeeShops
//
//  Created by anita on 12/10/18.
//  Copyright © 2018 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coffeeShops: [Venue]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON()
    }

    func downloadJSON() {
        let clientID = "P402HAXJU35OKOS2ZZLDC3QZ0JQPOZM3IWWQVF2ZR5FMW5MW"
        let clientSecret = "0RD2XLKTPVI11ZTXFH1RKWXOPJQC51IJ0IVCH1YJL4RUDXKF"
        let version = "20180323"
        let limit = "15"
        let latLong = "37.7751,-122.3977"
        let query = "coffeeshop"
        
        let urlString = "https://api.foursquare.com/v2/venues/explore?client_id=\(clientID)&client_secret=\(clientSecret)&v=\(version)&limit=\(limit)&ll=\(latLong)&query=\(query)"
        let url = URL(string: urlString)
        
        guard let downloadURL = url else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Something went wrong")
                return
            }
            
            do {
                let venues = try JSONDecoder().decode(VenueAPIResponse.self, from: data)
//                self.coffeeShops = venues.response.groups[0].items
//                print(venues.response.groups[0].items)
                self.coffeeShops = venues.response.groups[0].items.map { $0.venue }
//                for venue in venues.response.groups {
//                    for item in venue.items {
//                        print("Each Venue is: \(item.venue)\n")
//                    }
//                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeShops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell") as? VenueCell  else { return UITableViewCell() }

        return cell
    }
}
