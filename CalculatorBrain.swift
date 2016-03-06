//
//  CalculatorBrain.swift
//  division
//
//  Created by Icaro Barreira Lavrador on 7/02/16.
//  Copyright © 2016 Swift Next Step. All rights reserved.
//

import UIKit

class CalculatorBrain: NSObject {
    
    func divideTwoNumbers(dividend dividend: Int , divisor: Int, completion:((result:Float?, error:NSError?)->Void)) {
        if divisor == 0{
            let error = NSError(domain: "Error dividing by Zero", code: 1, userInfo: nil)
            return completion(result: nil, error: error)
        }
        return completion(result: (Float(dividend/divisor)), error: nil)
    }
}
