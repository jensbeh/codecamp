//
//  ResultView.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 27.11.23.
//

import SwiftUI
import MapKit

struct ResultView: View {
    @ObservedObject var resultsViewModel: ResultsViewModel = ResultsViewModel()
    @State private var selection: UUID?

    var body: some View {
        VStack(content: {
            Button("Add Coord", action: addCoods)
            Text(String(resultsViewModel.landmarks.count))
            
            Map(selection: $selection) {
                ForEach(resultsViewModel.landmarks) { location in
                    Marker(location.name, coordinate: location.locationCoordinate)
                        .tint(.orange)
                }
            }
        })
    }
    
    func addCoods() {
        resultsViewModel.addLandmark()
        resultsViewModel.landmarks.forEach({ Landmark in
            print(Landmark.locationCoordinate)
        })
    }
    
}

#Preview {
    ResultView()
}
