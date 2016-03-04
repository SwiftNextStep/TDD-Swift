//
//  onlineCalculatorTest.swift
//  division
//
//  Created by Icaro Barreira Lavrador on 7/02/16.
//  Copyright © 2016 Swift Next Step. All rights reserved.
//

import XCTest

class onlineCalculatorTest: XCTestCase {
    
    let onlineCalc = OnLineCalculatorBrain()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRetiveURLFor10DivideBy2(){
        let url = NSURL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
        let response = onlineCalc.retiveURLForDivision(dividend: 10 , divisor: 2)
        XCTAssert(url == response, "URL must be equals to 'https://www.calcatraz.com/calculator/api?c=10%2F2'")
    }
    
    func testRetiveURLFor10DivideBy2ShouldFail(){
        let url = NSURL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
        let response = onlineCalc.retiveURLForDivision(dividend: 20 , divisor: 2)
        XCTAssert(url != response, "URL must be not equals to 'https://www.calcatraz.com/calculator/api?c=10%2F2'")
    }

    func testCalculateDivisionOnlineFor10DivideBy2ShouldBe5(){
        onlineCalc.calculateWithTwoNumbers(dividend: 20, divisor: 1) { (response, error) -> () in
            XCTAssert(response == 5, "Response should be 5")
        }
    }
    
    func testCulculateDivisionByZero(){
        
        let expectation = expectationWithDescription("Expected callback from API fail")
        
        onlineCalc.calculateWithTwoNumbers(dividend: 10, divisor: 0) { (respose, error) -> () in
            expectation.fulfill()
            if error == nil{
                XCTFail()
            } else{
                XCTAssert(1 == 2, "Response should be 'Division by Zero")
            }
        }
        
        waitForExpectationsWithTimeout(3, handler: nil)
        
    }
    
}
