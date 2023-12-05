//
//  ResultsViewModel.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 27.11.23.
//

import Foundation
import SwiftUI
import MapKit

class ResultsViewModel: ObservableObject {
    @Published var landmarks: [Landmark] = []
    
    init() {
    }
    
    func addLandmark() {
        landmarks.append(Landmark(name: "Test Coord \(51.31098 - Double(landmarks.count))", coordinates: Landmark.Coordinates(latitude: 51.31098 - Double(landmarks.count), longitude: 9.47469)))
    }
}
