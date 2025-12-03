//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/2/25.
//

import SwiftUI

struct LandmarkList: View {
    /*
     * The Environment wrapper enables reading data into modelData automatically as long as a parent has a environment(_:) modeifer applied
     */
    @Environment(ModelData.self) var modelData
    /*
     * Create a state variable to hold the filter settings of the list
     * State variables should be private since they're specific to a view
     */
    @State private var showFavoritesOnly = false

    /*
     * Create the list to display that will only show the favorites if the state variable showFavoritesOnly is true
     */
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        /*
         * NavigationSplitView specifies a main and detail view for navigation
         * Detail contains a default for the split view which is sometimes open before a selection is made (iPad)
         */
        NavigationSplitView {
            /*
             * The list initializer requires identifiable data
             * The id property in landmarkData accomplishes this
             * This can also be done by ensuring conformity to the Identifiable protocol
             */
            List {
                // Use $ to access a binding to a state variable
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                /*
                 * Use ForEach to combine static and dynamic views in a list
                 */
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
