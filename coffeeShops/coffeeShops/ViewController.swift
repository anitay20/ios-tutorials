//
//  ViewController.swift
//  CoffeeShops
//
//  Created by anita on 12/10/18.
//  Copyright © 2018 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON()
        
    }

    func downloadJSON() {
        let clientID = "P402HAXJU35OKOS2ZZLDC3QZ0JQPOZM3IWWQVF2ZR5FMW5MW"
        let clientSecret = "0RD2XLKTPVI11ZTXFH1RKWXOPJQC51IJ0IVCH1YJL4RUDXKF"
        let limit = "15"
        let latLong = "37.7751,-122.3977"
        let query = "coffeeshop"
        
        let urlString = "https://api.foursquare.com/v2/venues/explore?client_id=\(clientID)&client_secret=\(clientSecret)&v=20180323&limit=\(limit)&ll=\(latLong)&query=\(query)"
        let url = URL(string: urlString)
        
        guard let downloadURL = url else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Something went wrong")
                return
            }
            
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            do {
                let venues = try JSONDecoder().decode(Venue.self, from: data)
                print(venues.id)
            } catch let error {
                print(error)
            }
        }.resume()
    }

}

