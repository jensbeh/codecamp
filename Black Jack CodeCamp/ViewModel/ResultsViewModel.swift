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
    @Published var gameStats: [GameStat] = []
    
    init() {
        // Generates few gameStats for testing
        // TODO remove later
        for _ in 1...8 {
            gameStats.append(
                GameStat(
                    timeInMs: 1702375584071,
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
                    timeInMs: 1702373904884,
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
                    timeInMs: 1702373503561,
                    result: ResultType.draw,
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
    
    // ======================
    // == Wins
    // ======================
    /// Method to get the wins count from all gameStats
    /// - Returns: Returns the wins count as Int
    func getWinsCount() -> Int {
        return gameStats.filter { GameStat in
            return GameStat.result == ResultType.win
        }.count
    }
    
    /// Method to get the rounded wins percentage
    /// - Returns: Returns the rounded wins percentage as Double
    func getRoundedWinsProcent() -> Double {
        let winsProcent = getWinsCount() > 0 ? Double(getWinsCount()) / Double(gameStats.count) * 100 : 0
        return round(winsProcent * 10) / 10
    }
    
    // ======================
    // == Looses
    // ======================
    /// Method to get the looses count from all gameStats
    /// - Returns: Returns the loose count as Int
    func getLooseCount() -> Int {
        return gameStats.filter { GameStat in
            return GameStat.result == ResultType.loose
        }.count
    }
    
    /// Method to get the rounded looses percentage
    /// - Returns: Returns the rounded looses percentage as Double
    func getRoundedLoosesProcent() -> Double {
        let loosesProcent = getLooseCount() > 0 ? Double(getLooseCount()) / Double(gameStats.count) * 100 : 0
        return round(loosesProcent * 10) / 10
    }
    
    // ======================
    // == Draws
    // ======================
    /// Method to get the draws count from all gameStats
    /// - Returns: Returns the draws count as Int
    func getDrawsCount() -> Int {
        return gameStats.filter { GameStat in
            return GameStat.result == ResultType.draw
        }.count
    }
    
    /// Method to get the rounded draws percentage
    /// - Returns: Returns the rounded draws percentage as Double
    func getRoundedDrawsProcent() -> Double {
        let drawsProcent = getDrawsCount() > 0 ? Double(getDrawsCount()) / Double(gameStats.count) * 100 : 0
        return round(drawsProcent * 10) / 10
    }
    
    // ======================
    // == ResultType
    // ======================
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
    
    // ======================
    // == Time
    // ======================
    /// Method to get the time of gameStat as formatted date string
    /// - Returns: Returns the time of gameStat as formatted date string
    func getTimeStr(gameStat: GameStat) -> String {
        let dateVar = Date.init(timeIntervalSince1970: TimeInterval(gameStat.timeInMs) / 1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm§dd.MM.yyyy"
        return dateFormatter.string(from: dateVar).replacingOccurrences(of: "§", with: "\n") // Move date to next line
    }
    
    // ======================
    // == GameStats
    // ======================
    /// Method to delete all game statistics from gameStats
    func deleteAllGameStats() {
        gameStats.removeAll()
    }
}
