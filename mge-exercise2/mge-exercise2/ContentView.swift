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
        /*
        Image("coffees")
            .resizable()
            .frame(width: 150, height: 230)
        */
        if swap {
            Image("coffees")
                .resizable()
                .frame(width: 130, height: 200)
                .matchedGeometryEffect(id: "coffees", in: photoTransition)
                .frame(width: 100)
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
                .frame(width: 100)
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
            .frame(width: 100)
            .animation(.linear)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
