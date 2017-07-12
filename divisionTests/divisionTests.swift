//
//  divisionTests.swift
//  divisionTests
//
//  Created by Icaro Barreira Lavrador on 7/02/16.
//  Copyright © 2016 Swift Next Step. All rights reserved.
//

import XCTest 
@testable import division

class divisionTests: XCTestCase {
    
    let calculatorBrain = CalculatorBrain()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test10DivideBy5MustBe2(){
        calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 5) { (result, error) -> Void in
            XCTAssert(result == 2, "Result must be 2")
        }
    }
    
    func test10DidideBy0MustBeNil(){
        calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 0) { (result, error) -> Void in
            XCTAssertNil(result, "Result must be nil")
            XCTAssert(error!.domain == "Error dividing by Zero", "Error message should be 'Error dividing by Zero'")
        }
    }
    
    func testTestDivisionTime(){
        measure {
            self.calculatorBrain.divideTwoNumbers(dividend: 20, divisor: 2, completion: { (result, error) -> Void in
                
            })
        }
    }
}
