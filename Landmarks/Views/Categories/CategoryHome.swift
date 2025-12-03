//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/3/25.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets()) //extend edges to end of the view
                
                // Display a list of sorted categories with a label being the category
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]! )
                }
                .listRowInsets(EdgeInsets()) 
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
