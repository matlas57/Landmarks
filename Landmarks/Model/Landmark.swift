//
//  Landmark.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/2/25.
//

import Foundation
import SwiftUI
import CoreLocation

/*
 * Creating a Landmark structure to store data important to a landmark
 * The Codable conformance make it easier to move data between a structure and a data file
 */
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // imageName contains the image file name so it can be read from assets
    private var imageName: String
    // a variable image with a Image UI element that uses the filename to render the image
    var image: Image {
        Image(imageName)
    }
    
    // a Coordinates variable containing lat and long defined in the struct below
    private var coordinates: Coordinates
    // locationCoordinate is useful for interaction with MapKit
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D (
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Codable, Hashable {
        var latitude: Double
        var longitude: Double
    }
}
