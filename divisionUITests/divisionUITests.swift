//
//  divisionUITests.swift
//  divisionUITests
//
//  Created by Icaro Barreira Lavrador on 7/02/16.
//  Copyright © 2016 Swift Next Step. All rights reserved.
//

import XCTest

class divisionUITests: XCTestCase {
    var app = XCUIApplication()
    var device = XCUIDevice()
    var element = XCUIElement()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMainScreen(){
        let labelText = app.staticTexts["Enter two numbers:"]
        XCTAssertTrue(labelText.exists, "Should be in the main screen")
    }
    
    func testCalculate10divideBy2LabelResult(){
        let div1 = app.textFields.elementBoundByIndex(0)
        let div2 = app.textFields.elementBoundByIndex(1)
        div1.tap()
        div1.typeText("10")
        div2.tap()
        div2.typeText("2")
        app.buttons["Calculate"].tap()
        XCTAssertTrue(app.staticTexts["5"].exists, "Result should be displaying '5'")
    }
    
    func testCalculate20divideBy10LabelResult(){
        
        let element = app.otherElements.containingType(.Image, identifier:"chalkboard").childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element
        let textField = element.childrenMatchingType(.TextField).elementBoundByIndex(0)
        textField.tap()
        
        let moreNumbersKey = app.keys["more, numbers"]
        moreNumbersKey.tap()
        textField.typeText("20")
        
        let textField2 = element.childrenMatchingType(.TextField).elementBoundByIndex(1)
        textField2.tap()
        moreNumbersKey.tap()
        textField2.typeText("10")
        app.buttons["Calculate"].tap()
        XCTAssertTrue(app.staticTexts["2"].exists, "Result should be displaying '2'")
    }
}
