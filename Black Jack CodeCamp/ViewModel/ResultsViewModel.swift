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
    var gameStats: [GameStat] = []
    
    init() {
        // Generates few gameStats for testing
        for _ in 1...4 {
            gameStats.append(
                GameStat(
                    time: 1,
                    result: ResultType.win,
                    finalPlayerValue: 20,
                    finalBankValue: 35,
                    landmark:
                        Landmark(
                            name: "Test Coord \(51.31098 - Double.random(in: 1..<6))",
                            coordinates:
                                Landmark.Coordinates(
                                    latitude: 51.31098 - Double.random(in: 1..<6),
                                    longitude: 9.47469
                                )
                        )
                )
            )
        }
        for _ in 1...3 {
            gameStats.append(
                GameStat(
                    time: 1,
                    result: ResultType.loose,
                    finalPlayerValue: 20,
                    finalBankValue: 35,
                    landmark:
                        Landmark(
                            name: "Test Coord \(51.31098 - Double.random(in: 1..<6))",
                            coordinates:
                                Landmark.Coordinates(
                                    latitude: 51.31098 - Double.random(in: 1..<6),
                                    longitude: 9.47469
                                )
                        )
                )
            )
        }
        for _ in 1...2 {
            gameStats.append(
                GameStat(
                    time: 1,
                    result: ResultType.tide,
                    finalPlayerValue: 20,
                    finalBankValue: 35,
                    landmark:
                        Landmark(
                            name: "Test Coord \(51.31098 - Double.random(in: 1..<6))",
                            coordinates:
                                Landmark.Coordinates(
                                    latitude: 51.31098 - Double.random(in: 1..<6),
                                    longitude: 9.47469
                                )
                        )
                )
            )
        }
    }
    
    
    /// Method to get the wins count from all gameStats
    /// - Returns: Returns the wins count as Int
    func getWinsCount() -> Int {
        return gameStats.filter { GameStat in
            return GameStat.result == ResultType.win
        }.count
    }
    
    /// Method to get the looses count from all gameStats
    /// - Returns: Returns the loose count as Int
    func getLooseCount() -> Int {
        return gameStats.filter { GameStat in
            return GameStat.result == ResultType.loose
        }.count
    }
    
    /// Method to get the tides count from all gameStats
    /// - Returns: Returns the tides count as Int
    func getTideCount() -> Int {
        return gameStats.filter { GameStat in
            return GameStat.result == ResultType.tide
        }.count
    }
    
    /// Method to get the resultType text from specific gameStats
    /// - Returns: Returns the result text as String
    func getResultTypeText(gameStat: GameStat) -> String {
        return gameStat.result.text
    }
    
    /// Method to get the resultType color from specific gameStats
    /// - Returns: Returns the result color as Color
    func getResultColor(gameStat: GameStat) -> Color {
        return gameStat.result.color
    }
    
    /// Method to get the resultType icon from specific gameStats
    /// - Returns: Returns the result icon as String
    func getResultIcon(gameStat: GameStat) -> String {
        return gameStat.result.icon
    }
}
