//
//  ContentView.swift
//  Matched Geometry Effect
//
//  Created by anita on 10/7/20.
//

// This is following the tutorial from https://www.appcoda.com/matchedgeometryeffect/

import SwiftUI

struct ContentView: View {
    
    @State private var expand = false
    
    @Namespace private var shapeTransition
    
    var body: some View {
        
        if expand {
            
            // Final State
            Circle()
                .fill(Color.green)
                .matchedGeometryEffect(id: "circle", in: shapeTransition)
                .frame(width: 300, height: 300)
                .offset(y: -200)
                .animation(.default)
                .onTapGesture {
                    self.expand.toggle()
                }
        } else {
            
            // Start State
            Circle()
                .fill(Color.green)
                .frame(width: expand ? 300 : 150, height: expand ? 300 : 150)
                .offset(y: expand ? -200 : 0)
                .animation(.default)
                .onTapGesture {
                    self.expand.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
