//
//  GameStat.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 05.12.23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class GameStat: Identifiable, Equatable {
    var id = UUID()
    var timeInMs: Int // timeIntervalSince1970 in milliseconds
    var result: ResultType
    var finalPlayerValue: Int
    var finalBankValue: Int
    var landmark: Landmark
    
    required init(timeInMs: Int, result: ResultType, finalPlayerValue: Int, finalBankValue: Int, landmark: Landmark) {
        self.timeInMs = timeInMs;
        self.result = result;
        self.finalPlayerValue = finalPlayerValue;
        self.finalBankValue = finalBankValue;
        self.landmark = landmark;
    }
    
    static func == (lhs: GameStat, rhs: GameStat) -> Bool {
        return lhs.id == rhs.id
    }
}
