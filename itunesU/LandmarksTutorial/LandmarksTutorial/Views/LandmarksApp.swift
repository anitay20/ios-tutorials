//
//  LandmarksApp.swift
//  LandmarksTutorial
//
//  Created by anita on 1/18/21.
//  Copyright © 2021 anita. All rights reserved.
//
// https://developer.apple.com/tutorials/swiftui/handling-user-input

import SwiftUI

//@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
