//
//  Game.swift
//  Black Jack CodeCamp
//
//  Created by Noah Uni on 02.12.23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Game{
    
    var gameState:GameState
    var dealerCards: [String]
    var playerCards: [String]
    var locations: [CustomLocation]
    var won: Bool
    
    init(gameState: GameState, dealerCards: [String], playerCards: [String], locations: [CustomLocation], won: Bool) {
        self.gameState = gameState
        self.dealerCards = dealerCards
        self.playerCards = playerCards
        self.locations = locations
        self.won = undefined
    }
    
    
}
