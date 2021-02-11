//
//  ContentView.swift
//  LandmarksTutorial
//
//  Created by anita on 6/5/19.
//  Copyright © 2019 anita. All rights reserved.
//

// https://developer.apple.com/tutorials/swiftui/creating-and-combining-views

import SwiftUI

struct ContentView : View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
#endif
