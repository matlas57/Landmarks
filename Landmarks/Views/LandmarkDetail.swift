//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/2/25.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        //Embed the following in a Scrolling Vertical Stack
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300) //if only height is specified the width is made proportional
            CircleImage(image: landmark.image)
                .offset(y: -130) //Add negative offset to overlay the image on the map
                .padding(.bottom, -130) //Add negative padding to move the VStack below upward
            
            VStack(alignment: .leading){
                Text(landmark.name)
                    .font(.title)
                //Embed the following in a Horizontal Stack
                HStack {
                    Text(landmark.park)
                    //                A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
                    Spacer()
                    Text(landmark.state)
                        
                } //Adding modifiers to the stack applies them to all elements inside
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }
            .padding()
            Spacer() //This spacer expands the space below the inner VStack to take up all available space, moving all the content upward
        }
        .navigationTitle(landmark.name) //Gives the nav bar a title in the detail view
        .navigationBarTitleDisplayMode(.inline) //Makes the title appear inline
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
