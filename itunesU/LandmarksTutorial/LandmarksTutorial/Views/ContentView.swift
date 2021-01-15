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
    var body: some View {
        LandmarkList()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
