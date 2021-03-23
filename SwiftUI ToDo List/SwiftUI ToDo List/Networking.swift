//
//  Networking.swift
//  SwiftUI ToDo List
//
//  Created by anita on 3/19/21.
//

import Foundation

struct Networking {
    static let sharedInstance = Networking()
    let session = URLSession.shared
    
    let url = "https://evilinsult.com/generate_insult.php?lang=en&type=json"

}
