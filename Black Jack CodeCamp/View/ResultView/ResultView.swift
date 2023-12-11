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
    
    var body: some View {
        NavigationStack {
            VStack(content: {
                
                // Display GameStats
                GameStatsView(resultsViewModel: resultsViewModel)
                
            })
            .navigationTitle("Statistics")
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                // Show map with all Locations
                NavigationLink(destination: CustomMapView(resultsViewModel: resultsViewModel)) {
                    Text(Image(systemName: "map"))
                }
            }
        }
    }
}

#Preview {
    MainView()
//    ResultView()
}
