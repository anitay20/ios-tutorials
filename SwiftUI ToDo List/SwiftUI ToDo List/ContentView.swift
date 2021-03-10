//
//  ContentView.swift
//  SwiftUI ToDo List
//
//  Created by anita on 3/9/21.
//  https://www.ioscreator.com/tutorials/swiftui-json-list-tutorial

import SwiftUI

struct Todo: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var completed: Bool
}

struct ContentView: View {
    
    @ObservedObject var fetch = FetchToDo()
    
    var body: some View {
        VStack {
            List(fetch.todos) { todo in
                VStack(alignment: .leading) {
                    Text(todo.title)
                    Text("\(todo.completed.description)") // print boolean
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
