//
//  ModelData.swift
//  Landmarks
//
//  Created by Matan Atlas on 12/2/25.
//

import Foundation

/*
 * Using Observable SwiftUI supports data changes without using property wrappers or bindings. SwiftUI watches for property changes that could affect a view and displays the correct version after a change
 */
@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter {$0.isFeatured}
    }
    
    // Add a dictionary with a category string as a name and a list of landmarks as values
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

/*
 * load fetches JSON data with a given name, it relies on the return types conformance to the Decondable protocol
 */
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // guard allows early exit if a condition is not met, the exit is defined in the else block
    // here we declare a file from the main bundle
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // Extract the data of the file into data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // Parse the JSON content with a JSONDecoder
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
