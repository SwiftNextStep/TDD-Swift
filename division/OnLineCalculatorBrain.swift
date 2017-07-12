//
//  OnLineCalculatorBrain.swift
//  division
//
//  Created by Icaro Barreira Lavrador on 7/02/16.
//  Copyright © 2016 Swift Next Step. All rights reserved.
//

import UIKit

class OnLineCalculatorBrain: NSObject {
    
    func retiveURLForDivision(dividend: Int , divisor: Int) -> URL{
        return URL(string: "https://www.calcatraz.com/calculator/api?c=\(dividend)%2F\(divisor)")!
    }
    
    func calculateWithTwoNumbers(dividend: Int , divisor: Int, completionHandler:@escaping (Float?, NSError?) ->()){
        let url = retiveURLForDivision(dividend: dividend, divisor: divisor)
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data:Data?, response:URLResponse?, error:NSError?) -> Void in
            if error == nil{
                if let data = data{
                    let sValue = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    let fValue = sValue?.floatValue
                    if fValue == nil || sValue!.length > 10{
                        let error = NSError(domain: "Division by Zero", code: 1, userInfo: nil)
                        return completionHandler(nil, error)
                    }
                    return completionHandler(sValue?.floatValue, nil)
                }
                let localError = NSError(domain: "No data was found", code: 1, userInfo: nil)
                return completionHandler(nil, localError)
            } else{
                print(error?.localizedDescription ?? "")
                return completionHandler(nil, error)
            }
        } as! (Data?, URLResponse?, Error?) -> Void) 
        task.resume()
    }
}
