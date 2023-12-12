//
//  TestGameModel.swift
//  Black Jack CodeCampTests
//
//  Created by Noah Uni on 09.12.23.
//

import Foundation
import XCTest
@testable import Black_Jack_CodeCamp

final class GameModelTests: XCTestCase {
    
    func testGameModelMehtods(){
        let deck = Deck(deckId: "test123556", remainingCards: 52)
        let game = Game(gameState: GameState.running, dealerCards: [], playerCards: [], locations: [], won: false, deck: deck)
        
        game.appendDealerCard(card: "KH")
        
        XCTAssertEqual(["KH"], game.dealerCards)
        
        let testLoc = CustomLocation(longitude: 22.1234511, latitude: 512.211312)
        game.appendLocation(loc: CustomLocation(longitude: 22.1234511, latitude: 512.211312))
        
        XCTAssertEqual([testLoc], game.locations)
        
        XCTAssertFalse(game.isWon())
        
        game.setWon()
        XCTAssertTrue(game.isWon())
        
        
    }
    
}
