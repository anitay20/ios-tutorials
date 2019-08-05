//
//  ContentView.swift
//  LandmarksTutorial
//
//  Created by anita on 6/5/19.
//  Copyright © 2019 anita. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Turtle Rock")
            .font(.title)
            .color(.green)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
