//
//  ContentView.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/2/25.
//

import SwiftUI

/*
 * Uses the View protocol to define the content and layout
 */
struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // The tag modifier matches a potential selection value so SwiftUI can determine which tab to display based on the value of selection
        TabView(selection: $selection){
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}


// A preview of the main ContentView
#Preview {
    ContentView()
        .environment(ModelData()) // For @Environment to work in LandmarkList, its parent must have a environment modifier set
}
