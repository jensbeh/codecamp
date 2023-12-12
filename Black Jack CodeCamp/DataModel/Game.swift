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
    var deck:Deck
//    TODO use custom type instead of string?
    var dealerCards: [String]
    var playerCards: [String]
    var locations: [CustomLocation]
    var won: Bool
    
    init(gameState: GameState, dealerCards: [String], playerCards: [String], locations: [CustomLocation], won: Bool,deck:Deck) {
        self.gameState = gameState
        self.deck=deck
        self.dealerCards = dealerCards
        self.playerCards = playerCards
        self.locations = locations
        self.won = false
    }
    
    
    ///Add a card to the players card stack
    func appendPlayerCard(card:String){
        self.playerCards.append(card)
    }
    
    ///Add a cart to the dealers card stack
    func appendDealerCard(card:String){
        self.dealerCards.append(card)
    }
    
    ///Add to locations
    func appendLocation(loc:CustomLocation){
        self.locations.append(loc)
    }
    
    ///Check if this Game instance is won
    ///The necessary conditions are won and finished is true
    func isWon()-> Bool{
        return self.won && self.gameState==GameState.finished
    }
    
    ///Sets the game to won by setting the game state to finished and the bool to true
    func setWon(){
        self.gameState=GameState.finished
        won=true
    }
    
    
    ///Sets the game to lost by just setting the game state to finished
    func setLoss(){
        gameState=GameState.finished
    }
    
    
}
