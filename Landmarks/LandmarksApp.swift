//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/2/25.
//

import SwiftUI


/*
 * @main defines the apps entry point
 * body returns scenes which provide content fot the display
 */
@main
struct LandmarksApp: App {
    /*
     * Use state to store modelData so that its created once during an apps lifetime
     * Pass the modelData to the app whenever the app is run through an environment modifier
     */
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
