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
    var body: some View {
        //Embed the following in a Vertical Stack
        VStack {
            MapView()
                .frame(height: 300) //if only height is specified the width is made proportional
            CircleImage()
                .offset(y: -130) //Add negative offset to overlay the image on the map
                .padding(.bottom, -130) //Add negative padding to move the VStack below upward
            
            VStack(alignment: .leading){
                Text("Turtle Rock")
                    .font(.title)
                //Embed the following in a Horizontal Stack
                HStack {
                    Text("Joshua Tree National Park")
                    //                A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
                    Spacer()
                    Text("California")
                        
                } //Adding modifiers to the stack applies them to all elements inside
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Description text goes here.")
                
            }
            .padding()
            Spacer() //This spacer expands the space below the inner VStack to take up all available space, moving all the content upward
        }
    }
}


// A preview of the main ContentView
#Preview {
    ContentView()
}
