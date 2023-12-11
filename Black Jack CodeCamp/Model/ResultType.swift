//
//  ResultType.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 11.12.23.
//

import Foundation
import SwiftUI

enum ResultType {
    case win, loose, draw
    
    // result text
    var text: String {
        switch self {
            case .win: return "Win"
            case .loose: return "Loose"
            case .draw: return "Draw"
        }
    }
    
    // result color
    var color: Color {
        switch self {
            case .win: return Color.green
            case .loose: return Color.red
            case .draw: return Color.gray
        }
    }
    
    // result icon
    var icon: String {
        switch self {
            case .win: return "checkmark"
            case .loose: return "xmark"
            case .draw: return "equal"
        }
    }
}
