//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Nick Sarno on 11/27/21.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    
    var name: String
    var cityName: String
    var coordinates: CLLocationCoordinate2D
    var description: String
    var imageNames: [String]
    
    // Identifiable
    var id: String {
        // name = "Colosseum"
        // cityName = "Rome"
        // id = "ColosseumRome"
        name + cityName
    }
    static let example = Location(name: "new", cityName: "new", coordinates: CLLocationCoordinate2D(latitude: 18.500389053565954, longitude: 73.93898344612651), description: "new", imageNames: ["new"])


    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }

}
