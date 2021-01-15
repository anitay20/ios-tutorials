//
//  LandmarkList.swift
//  LandmarksTutorial
//
//  Created by anita on 1/15/21.
//  Copyright © 2021 anita. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
