//
//  MainScreenTests.swift
//  Black Jack CodeCampUITests
//
//  Created by Jens Behmenburg on 18.12.23.
//

import XCTest
@testable import Black_Jack_CodeCamp

final class MainScreenTests: XCTestCase {
    struct AccessibilityIdentifier {
        static let mainMenuButtonPlay = "mainMenuButtonPlay"
        static let mainMenuButtonResults = "mainMenuButtonResults"
        static let mainMenuView = "mainMenuView"
        static let resultViewScrollView = "resultViewScrollView"
    }

    override func setUpWithError() throws {
        // Called before every test
        // Initilize objects here, set up interface orientation, ...
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
    }

    override func tearDownWithError() throws {
        // Called after every test
        // Cleanup objects here, ...
    }

    func testChangeToResultView() throws {
        let app = XCUIApplication()
        app.launch()
        
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

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
