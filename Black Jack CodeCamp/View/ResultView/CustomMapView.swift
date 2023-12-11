//
//  Map.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 11.12.23.
//

import SwiftUI
import MapKit

struct CustomMapView: View {
    @ObservedObject var resultsViewModel: ResultsViewModel
    @State private var selection: UUID?
    
    init(resultsViewModel: ResultsViewModel) {
        self.resultsViewModel = resultsViewModel
    }
    
    var body: some View {
        Map(selection: $selection) {
            ForEach(resultsViewModel.gameStats) { gameStat in
                Marker(
                    gameStat.landmark.name,
                    systemImage: resultsViewModel.getResultIcon(gameStat: gameStat),
                    coordinate: gameStat.landmark.locationCoordinate
                )
                .tint(resultsViewModel.getResultColor(gameStat: gameStat))
            }
        }
        .safeAreaInset(edge: .bottom) {
            // Specific Location/Game informations on click
            HStack {
                Spacer()
                VStack(spacing: 0) {
                    if let selection {
                        if let gameStat = resultsViewModel.gameStats.first(where: { $0.id == selection }) {
                            
                            VStack {
                                Text("Time")
                                Text(String(gameStat.time))
                                Spacer()
                                    .frame(height: 20)
                                Text("Location")
                                Text("latitude: " + String(gameStat.landmark.locationCoordinate.latitude) + "\nlongitude: " + String(gameStat.landmark.locationCoordinate.longitude))
                                Spacer()
                                    .frame(height: 20)
                                Text("Result Type")
                                Text(String(resultsViewModel.getResultTypeText(gameStat: gameStat)))
                                Spacer()
                                       .frame(height: 20)
                                   Text("Player Hand Values")
                                   Text(String(gameStat.finalPlayerValue))
                                Spacer()
                                       .frame(height: 20)
                                   Text("Bank Hand Values")
                                   Text(String(gameStat.finalBankValue))
                            }
                        }
                    }
                }
                Spacer()
            }
            .background(.thinMaterial)
        }
        .onChange(of: selection) {
            guard let selection else { return }
            guard let item = resultsViewModel.gameStats.first(where: { $0.id == selection }) else { return }
            print("On Tap -- latitude: " + String(item.landmark.locationCoordinate.latitude) + "; longitude: " + String(item.landmark.locationCoordinate.longitude))
        }
        
        .navigationTitle("Map")
    }
}

#Preview {
    MainView()
}
