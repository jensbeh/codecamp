//
//  Landmark.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 27.11.23.
//

import Foundation
import MapKit

class Landmark: Identifiable, Equatable  {
    var id = UUID()
    var name: String
    
    // Coordinates
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    struct Coordinates {
        var latitude: Double
        var longitude: Double
    }
    
    // Methods
    required init(name: String, coordinates: Coordinates) {
        self.name = name
        self.coordinates = coordinates
    }
    
    static func == (lhs: Landmark, rhs: Landmark) -> Bool {
        return lhs.id == rhs.id
    }
}
