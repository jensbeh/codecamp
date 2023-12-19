//
//  MainScreenTests.swift
//  Black Jack CodeCampUITests
//
//  Created by Jens Behmenburg on 18.12.23.
//

import XCTest
import SwiftData
@testable import Black_Jack_CodeCamp

@MainActor
final class ResultViewTests: XCTestCase {
    struct AccessibilityIdentifier {
        static let mainMenuButtonResults = "mainMenuButtonResults"
        static let mainMenuView = "mainMenuView"
        static let resultViewScrollView = "resultViewScrollView"
        static let resultViewMapButton = "resultViewMapButton"
        static let resultViewDeleteStatsButton = "resultViewDeleteStatsButton"
        static let customMapViewMap = "customMapViewMap"
        static let resultViewDeleteStatsAlert = "resultViewDeleteStatsAlert"
        static let resultViewDeleteStatsCancelButton = "resultViewDeleteStatsCancelButton"
        static let resultViewDeleteStatsYesButton = "resultViewDeleteStatsYesButton"
    }

    override func setUpWithError() throws {
        // Called before every test
        // Initilize objects here, set up interface orientation, ...
        continueAfterFailure = true
        XCUIDevice.shared.orientation = .portrait
    }

    override func tearDownWithError() throws {
        // Called after every test
        // Cleanup objects here, ...
    }
    
    func changeToResultView(app: XCUIApplication) {
        // Check if main view is viewed
        let mainViewNavigationStack = app.otherElements[AccessibilityIdentifier.mainMenuView]
        XCTAssertTrue(mainViewNavigationStack.exists)

        // Click on mainMenuButtonResults
        let mainMenuButtonResults = app.buttons[AccessibilityIdentifier.mainMenuButtonResults]
        XCTAssertTrue(mainMenuButtonResults.exists)
        mainMenuButtonResults.tap()
        
        // Check if result view is viewed
        let resultViewScrollView = app.scrollViews[AccessibilityIdentifier.resultViewScrollView]
        XCTAssertTrue(resultViewScrollView.exists)
    }
    
    func testChangeToMapView() throws {
        let app = XCUIApplication()
        app.launch()
        
        changeToResultView(app: app)

        // Click on resultViewMapButton
        let resultViewMapButton = app.buttons[AccessibilityIdentifier.resultViewMapButton]
        XCTAssertTrue(resultViewMapButton.exists)
        resultViewMapButton.tap()
        // Check if map view is viewed
        let customMapViewMap = app.otherElements[AccessibilityIdentifier.customMapViewMap]
        XCTAssertTrue(customMapViewMap.exists)
    }
    
    func testOpenMarkerOnMap() throws {
        let app = XCUIApplication()
        app.launch()
        
        changeToResultView(app: app)

        // Click on resultViewMapButton
        let resultViewMapButton = app.buttons[AccessibilityIdentifier.resultViewMapButton]
        XCTAssertTrue(resultViewMapButton.exists)
        resultViewMapButton.tap()
        // Check if map view is viewed
        let customMapViewMap = app.otherElements[AccessibilityIdentifier.customMapViewMap]
        XCTAssertTrue(customMapViewMap.exists)
        
        
            let test = app.debugDescription.utf8
            print(test)
        
        
    }
    
    func testDeleteAllStats() throws {
        let app = XCUIApplication()
        // TODO Add gameStats
        app.launch()
        
        changeToResultView(app: app)

        // CANCEL BUTTON
        // Click on resultViewDeleteStatsButton
        let resultViewDeleteStatsButton = app.buttons[AccessibilityIdentifier.resultViewDeleteStatsButton]
        XCTAssertTrue(resultViewDeleteStatsButton.exists)
        resultViewDeleteStatsButton.tap()

        // Click on resultViewDeleteStatsCancelButton
        let resultViewDeleteStatsCancelButton = app.buttons[AccessibilityIdentifier.resultViewDeleteStatsCancelButton]
        XCTAssertTrue(resultViewDeleteStatsCancelButton.exists)
        resultViewDeleteStatsCancelButton.tap()
        
        // Check if alert is removed
        let resultViewDeleteStatsCancelButton2 = app.buttons[AccessibilityIdentifier.resultViewDeleteStatsCancelButton]
        XCTAssertFalse(resultViewDeleteStatsCancelButton2.exists)
        
        // YES BUTTON
        // Click on resultViewDeleteStatsButton
        XCTAssertTrue(resultViewDeleteStatsButton.exists)
        resultViewDeleteStatsButton.tap()

        // Click on resultViewDeleteStatsYesButton
        let resultViewDeleteStatsYesButton = app.buttons[AccessibilityIdentifier.resultViewDeleteStatsYesButton]
        XCTAssertTrue(resultViewDeleteStatsYesButton.exists)
        resultViewDeleteStatsYesButton.tap()
        
        // Check if alert is removed
        let resultViewDeleteStatsYesButton2 = app.buttons[AccessibilityIdentifier.resultViewDeleteStatsYesButton]
        XCTAssertFalse(resultViewDeleteStatsYesButton2.exists)
        
        
//        let test = app.debugDescription.utf8
//        print(test)
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
