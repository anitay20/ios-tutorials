//
//  ContentView.swift
//  Matched Geometry Effect
//
//  Created by anita on 10/7/20.
//

// This is following the tutorial from https://www.appcoda.com/matchedgeometryeffect/

import SwiftUI

struct ContentView: View {
    
    @State private var swap = false
    @Namespace private var dotTransition
    
    var body: some View {
        if swap {
            // After swap
            // Green dot on the left, Orange dot on the right
            HStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .matchedGeometryEffect(id: "greenCircle", in: dotTransition)
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                Circle()
                    .fill(Color.orange)
                    .frame(width: 30, height: 30)
                    .matchedGeometryEffect(id: "orangeCircle", in: dotTransition)
            }
            .frame(width: 100)
            .animation(.linear)
            .onTapGesture {
                swap.toggle()
            }
        } else {
            // Start state
            // Orange dot on the left, Green dot on the right
            HStack {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 30, height: 30)
                    .matchedGeometryEffect(id: "orangeCircle", in: dotTransition)
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .matchedGeometryEffect(id: "greenCircle", in: dotTransition)
            }
            .frame(width: 100)
            .animation(.linear)
            .onTapGesture {
                swap.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
