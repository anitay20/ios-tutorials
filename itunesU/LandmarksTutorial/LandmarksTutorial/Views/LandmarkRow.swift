//
//  LandmarkRow.swift
//  LandmarksTutorial
//
//  Created by anita on 1/15/21.
//  Copyright © 2021 anita. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
