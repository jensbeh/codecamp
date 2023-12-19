//
//  ResultType.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 11.12.23.
//

import Foundation
import SwiftUI

enum ResultType {
    case win, lose, tie
    
    // result text
    var text: String {
        switch self {
            case .win: return "Win"
            case .lose: return "Lose"
            case .tie: return "Tie"
        }
    }
    
    // result color
    var color: Color {
        switch self {
            case .win: return Color.green
            case .lose: return Color.red
            case .tie: return Color.gray
        }
    }
    
    // result icon
    var icon: String {
        switch self {
            case .win: return "checkmark"
            case .lose: return "xmark"
            case .tie: return "equal"
        }
    }
}
