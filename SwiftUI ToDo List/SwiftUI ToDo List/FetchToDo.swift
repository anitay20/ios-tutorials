//
//  FetchTodo.swift
//  SwiftUI ToDo List
//
//  Created by anita on 3/9/21.
//

import Foundation

class FetchToDo: ObservableObject {
    @Published var todos = [Todo]()
    
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
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
