//
//  GameStatsTests.swift
//  Black Jack CodeCampTests
//
//  Created by Jens Behmenburg on 18.12.23.
//

import XCTest
@testable import Black_Jack_CodeCamp

final class GameStatsTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testGameStat() throws {
        let gameStat = GameStat(
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
        );
        
//        let deck = GameStat(deckId: "test123556", remainingCards: 52)
//        let game = Game(gameState: GameState.running, dealerCards: [], playerCards: [], locations: [], won: false, deck: deck)
//
//        game.appendDealerCard(card: "KH")
//
//        XCTAssertEqual(["KH"], game.dealerCards)
//
//        let testLoc = CustomLocation(longitude: 22.1234511, latitude: 512.211312)
//        game.appendLocation(loc: CustomLocation(longitude: 22.1234511, latitude: 512.211312))
//
//        XCTAssertEqual([testLoc], game.locations)
//
//        XCTAssertFalse(game.isWon())
//
//        game.setWon()
//        XCTAssertTrue(game.isWon())
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
