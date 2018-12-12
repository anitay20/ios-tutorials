//
//  ClickButtonUITests.swift
//  BullsEye2UITests
//

import XCTest

class ClickButtonUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        
    }

    func testExample() {
//        let app = XCUIApplication()
        app.buttons["Hit Me!"].tap()
        app.alerts.firstMatch.buttons["OK"].tap()
//        app.alerts["Close but not that close"].buttons["OK"].tap()
        app.buttons["More Info"].tap()
        app.buttons["Close"].tap()
        app.buttons["Reset"].tap()
        app.alerts["Reset"].buttons["Yes"].tap()
        sleep(10)
        print(app.staticTexts["Score: 0"].exists)
        XCTAssert(app.staticTexts["Score: 0"].exists)
        sleep(5)
    }
    
}
