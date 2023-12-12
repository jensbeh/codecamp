//
//  CustomLocation.swift
//  Black Jack CodeCamp
//
//  Created by Noah Uni on 02.12.23.
//

import Foundation
import SwiftData

@Model
class CustomLocation{
    var longitude: Double
    var latitude: Double
    
    init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
}
