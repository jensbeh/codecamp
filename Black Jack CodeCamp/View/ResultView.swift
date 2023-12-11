//
//  ResultView.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 27.11.23.
//

import SwiftUI
import MapKit
import Charts

struct ResultView: View {
    @ObservedObject var resultsViewModel: ResultsViewModel = ResultsViewModel()
    @State private var selection: UUID?
    
    var body: some View {
        // TODO Add to ViewModel
        let winsProcent = Double(resultsViewModel.getWinsCount()) / Double(resultsViewModel.gameStats.count) * 100
        let roundedWinsProcent = round(winsProcent * 10) / 10
        let loosesProcent = Double(resultsViewModel.getLooseCount()) / Double(resultsViewModel.gameStats.count) * 100
        let roundedLoosesProcent = round(loosesProcent * 10) / 10
        let drawsProcent = Double(resultsViewModel.getDrawsCount()) / Double(resultsViewModel.gameStats.count) * 100
        let roundedDrawsProcent = round(drawsProcent * 10) / 10

        VStack(content: {
            
            // Display Map with all Locations
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
            
            // Display GameStats
            HStack(content: {
                VStack(content: {
                    VStack(content: {
                        Text("Total Games")
                        Text(String(resultsViewModel.gameStats.count))
                    })
                })
            })
            
            Chart {
                BarMark(
                    x: .value("Shape Type", ResultType.win.text),
                    y: .value("Total Count", resultsViewModel.getWinsCount())
                )
                .annotation(position: .overlay, alignment: .center, spacing: 3, content: {
                    Text(String(roundedWinsProcent) + "%")
                })
                .foregroundStyle(.green)
                BarMark(
                     x: .value("Shape Type", ResultType.loose.text),
                     y: .value("Total Count", resultsViewModel.getLooseCount())
                )
                .annotation(position: .overlay, alignment: .center, spacing: 3, content: {
                    Text(String(roundedLoosesProcent) + "%")
                })
                .foregroundStyle(.red)
                BarMark(
                    x: .value("Shape Type", ResultType.draw.text),
                    y: .value("Total Count", resultsViewModel.getDrawsCount())
                )
                .annotation(position: .overlay, alignment: .center, spacing: 3, content: {
                    Text(String(roundedDrawsProcent) + "%")
                })
                .foregroundStyle(.gray)
            }
        })
    }
}

#Preview {
    ResultView()
}
