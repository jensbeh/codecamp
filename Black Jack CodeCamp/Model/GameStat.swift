//
//  GameStat.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 05.12.23.
//

import Foundation
import SwiftUI

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
