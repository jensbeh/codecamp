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
    @State private var isShowingDeleteGameStatsConfirmation = false

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
                
                Button {
                    isShowingDeleteGameStatsConfirmation = true
                } label: {
                    Image(systemName: "trash")
                }
                // Show alert of delete all game statistics
                .alert("Delete all game statistics", isPresented: $isShowingDeleteGameStatsConfirmation) {
                    Button("Cancel", role: .cancel) {
                        // No action needed
                    }
                    Button("Yes", role: .destructive) {
                        // Delete all game statistics
                        resultsViewModel.deleteAllGameStats()
                    }
                } message: {
                    Text("Are you sure you want to delete all game statistics?")
                }
            }
        }
    }
}

#Preview {
    MainView()
//    ResultView()
}
