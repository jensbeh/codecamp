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
        
        // Show map
        Map(selection: $selection) {
            // Add markers
            ForEach(resultsViewModel.gameStats) { gameStat in
                Marker(
                    gameStat.landmark.name,
                    systemImage: resultsViewModel.getResultIcon(gameStat: gameStat),
                    coordinate: gameStat.landmark.locationCoordinate
                )
                .tint(resultsViewModel.getResultColor(gameStat: gameStat))
            }
        }
        .accessibilityIdentifier("customMapViewMap")
        .safeAreaInset(edge: .bottom) {
            // Specific Location/Game informations on click
            HStack {
                Spacer()
                VStack(spacing: 0) {
                    if let selection {
                        if let gameStat = resultsViewModel.gameStats.first(where: { $0.id == selection }) {
                            
                            VStack {
                                Text("Time")
                                    .font(.headline)
                                Text(String(resultsViewModel.getTimeStr(gameStat: gameStat)))
                                    .multilineTextAlignment(.center)
                                Spacer()
                                    .frame(height: 20)
                                Text("Location")
                                    .font(.headline)
                                Text("latitude: " + String(gameStat.landmark.locationCoordinate.latitude) + "\nlongitude: " + String(gameStat.landmark.locationCoordinate.longitude))
                                Spacer()
                                    .frame(height: 20)
                                Text("Result Type")
                                    .font(.headline)
                                Text(String(resultsViewModel.getResultTypeText(gameStat: gameStat)))
                                Spacer()
                                    .frame(height: 20)
                                Text("Player Hand Values")
                                    .font(.headline)
                                Text(String(gameStat.finalPlayerValue))
                                Spacer()
                                    .frame(height: 20)
                                Text("Bank Hand Values")
                                    .font(.headline)
                                Text(String(gameStat.finalBankValue))
                            }
                            .padding(10)
                        }
                    }
                }
                Spacer()
            }
            .background(.thinMaterial)
            .padding(.bottom, 20)
            .cornerRadius(20)
            .padding(.bottom, -20)
        }
        .onChange(of: selection) {
            // On selection of marker
            guard let selection else { return }
            guard let item = resultsViewModel.gameStats.first(where: { $0.id == selection }) else { return }
            print("On Tap -- latitude: " + String(item.landmark.locationCoordinate.latitude) + "; longitude: " + String(item.landmark.locationCoordinate.longitude))
        }
        
        .navigationTitle("Map")
    }
}

#Preview {
    CustomMapView(resultsViewModel: ResultsViewModel())
}
