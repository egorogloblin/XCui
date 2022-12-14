//
//  ChantalUITests.swift
//  ChantalUITests
//
//  Created by Егор Оглоблин on 14.12.2022.
//  Copyright © 2022 Monte Thakkar. All rights reserved.
//

import XCTest

final class ChantalUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.navigationBars.buttons["Add"].tap()
        
        app.alerts.textFields["Enter task name..."].tap()
        app.alerts.textFields["Enter task name..."].typeText("Задача")
        
        app.alerts.buttons["Add"].tap()
        
        XCTAssert(app.cells.staticTexts["Задача"].exists)
        
        app.cells.staticTexts["Задача"].swipeRight()
        app.cells.staticTexts["Задача"].swipeRight()
        
        XCTAssert(app.cells.staticTexts["Задача"].exists)
        
        app.cells.staticTexts["Задача"].swipeLeft()
        app.cells.buttons["delete"].tap()
        
        XCTAssertFalse(app.cells.staticTexts["Задача"].exists)
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
