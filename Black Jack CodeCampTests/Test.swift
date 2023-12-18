//
//  Test.swift
//  Black Jack CodeCampTests
//
//  Created by Jens Behmenburg on 18.12.23.
//

import XCTest
@testable import Black_Jack_CodeCamp

final class Test: XCTestCase {
    struct AccessibilityIdentifier {
        static let mainMenuButtonPlay = "mainMenuButtonPlay"
        static let mainMenuButtonResults = "mainMenuButtonResults"
    }

    override func setUpWithError() throws {
        // Called before every test
        // Initilize objects here, set up interface orientation, ...
        
//        let rvm = ResultsViewModel();
//        let singleGameStat = GameStat(
//            timeInMs: 1702375584071,
//            result: ResultType.win,
//            finalPlayerValue: 20,
//            finalBankValue: 35,
//            landmark:
//                Landmark(
//                    name: "Test Coord \(51.31098 - Double.random(in: 1..<6))",
//                    coordinates:
//                        Landmark.Coordinates(
//                            latitude: 51.31098 - Double.random(in: 1..<6),
//                            longitude: 9.47469
//                        )
//                )
//        );
        

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Called after every test
        // Cleanup objects here, ...
    }
    
    func modelTest() throws {
        let app = XCUIApplication()
        app.launch()
        
    }
    

    func testResultView() throws {
//        let app = XCUIApplication()
//        app.launch()
//
//        // Click on mainMenuButtonResults
//        let mainMenuButtonResults = app.buttons[AccessibilityIdentifier.mainMenuButtonResults]
//        XCTAssertTrue(mainMenuButtonResults.exists)
//        mainMenuButtonResults.tap()

    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
