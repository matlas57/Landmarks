//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/4/25.
//

import SwiftUI

struct ProfileHost: View {
    // Edit mode is build into the environment and is used to read, write, and edit scope
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                // Add a cancel button in editMode that discards changes made to the draft profile during editting
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton() //Edit button acts on the editMode environment variable
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    // When the profile editor appears set the draftProfile to the most recent version in the modelData
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    // When the profile editor disappears, save the changes made to the draftProfile during editting to the modelData profile
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData()) // A child view requires the environment data
}
