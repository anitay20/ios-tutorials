//
//  ContentView.swift
//  mge-exercise2
//
//  Created by anita on 11/3/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var swap = false
    @Namespace private var photoTransition
    
    var body: some View {
        
        if swap {
            HStack {
                Image("coffees")
                    .resizable()
                    .frame(width: 130, height: 200)
                    .matchedGeometryEffect(id: "coffees", in: photoTransition)
                    .animation(.linear)
                Image("leftRightArrows")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .onTapGesture{
                        swap.toggle()
                    }
                Image("cupOfCoffee")
                    .resizable()
                    .frame(width: 130, height: 200)
                    .matchedGeometryEffect(id: "cupOfCoffee", in: photoTransition)
//                    .animation(.linear)
            }
            .animation(.linear)
        } else {
            HStack {
                Image("cupOfCoffee")
                    .resizable()
                    .frame(width: 130, height: 200)
                    .matchedGeometryEffect(id: "cupOfCoffee", in: photoTransition)
                Image("leftRightArrows")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .onTapGesture{
                        swap.toggle()
                    }
                Image("coffees")
                    .resizable()
                    .frame(width: 130, height: 200)
                    .matchedGeometryEffect(id: "coffees", in: photoTransition)
            }   
            .animation(.linear)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
