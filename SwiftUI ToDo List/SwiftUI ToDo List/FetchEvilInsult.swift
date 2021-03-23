//
//  FetchEvilInsult.swift
//  SwiftUI ToDo List
//
//  Created by anita on 3/10/21.
//

import Foundation

/*
 {
     "number": "110",
     "language": "en",
     "insult": "Do your keepers a huge favor: do a triple summersault through the air, and disappear up your own asshole.",
     "created": "2021-03-10 11:06:32",
     "shown": "130876",
     "createdby": "",
     "active": "1",
     "comment": ""
 }
*/

class FetchEvilInsult: ObservableObject {
    
    @Published var insult: String = ""
    
    init() {
        let url = URL(string: "https://evilinsult.com/generate_insult.php?lang=en&type=json")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let insultData = data {
                    let decodedData = try JSONDecoder().decode(insult.self, from: insultData)
                    DispatchQueue.main.async {
                        self.insult = decodedData
                    }
                } else {
                    print("no data")
                }
            } catch {
                print("error")
            }
        }.resume()
    }
}

struct Insult: Decodable {
    let number: Int
    let language: String
    let insult: String
    let created: String
    let shown: Int
    let createdBy: String
    let active: Int
    let comment: String
}
