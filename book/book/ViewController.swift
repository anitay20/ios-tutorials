//
//  ViewController.swift
//  book
//
//  Created by anita on 12/11/18.
//  Copyright © 2018 anita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct BookAPIResponse: Decodable {
        let items : [Book]
    }
    
    struct Book: Decodable {
        let kind: String
        let volumeInfo: Info
    }
    
    struct Info: Decodable {
        let title: String
        let authors: [String]
    }
    
    func getBookInfo() {
        let jsonUrlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:1603091467&key=AIzaSyByVxRsAT9AbhRm9cfJ7NRW9d9HI7Af_ec"
        
        guard let url = URL(string: jsonUrlString) else {
            print("invalid url string lel")
            return
        }
        
        print("starting urlsession")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
//            print(String(data: data, encoding: .utf8))
            do {
                let decoder = JSONDecoder()
                let bookAPIResponse = try decoder.decode(BookAPIResponse.self, from: data)
                for book in bookAPIResponse.items {
                    print("book Data is \(book)")
                }


            } catch let error {
                print("Failed to decode JSON:", error)
            }
            }.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getBookInfo()
    }


}

