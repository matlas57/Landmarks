//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/3/25.
//

import SwiftUI

struct FavoriteButton: View {
    /*
     * binding property wrapper enables reading and writing between a property that stores data and a view that displays it. Changes made inside the view to the binding propagate back to the data source.
     */
    @Binding var isSet: Bool
    var body: some View {
        /*
         * Create a button that toggles isSet
         * The button appearance changes based on isSets state
         * When using iconOnly the text wont appear on screen but will be used for voiceover accessibility settings
         */
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow: .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
