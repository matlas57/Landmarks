//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/2/25.
//

import SwiftUI

struct LandmarkList: View {
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
            List (landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
