//
//  GameStat.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 05.12.23.
//

import Foundation
import SwiftUI

enum ResultType {
    case win, loose, tide
    
    // result text
    var text: String {
        switch self {
            case .win: return "Win"
            case .loose: return "Loose"
            case .tide: return "Tide"
        }
    }
    
    // result color
    var color: Color {
        switch self {
            case .win: return Color.green
            case .loose: return Color.red
            case .tide: return Color.gray
        }
    }
    
    // result icon
    var icon: String {
        switch self {
            case .win: return "checkmark"
            case .loose: return "xmark"
            case .tide: return "equal"
        }
    }
}

class GameStat: Identifiable, Equatable {
    var id = UUID()
    var time: Int
    var result: ResultType
    var finalPlayerValue: Int
    var finalBankValue: Int
    var landmark: Landmark
    
    required init(time: Int, result: ResultType, finalPlayerValue: Int, finalBankValue: Int, landmark: Landmark) {
        self.time = time;
        self.result = result;
        self.finalPlayerValue = finalPlayerValue;
        self.finalBankValue = finalBankValue;
        self.landmark = landmark;
    }
    
    static func == (lhs: GameStat, rhs: GameStat) -> Bool {
        return lhs.id == rhs.id
    }
}
