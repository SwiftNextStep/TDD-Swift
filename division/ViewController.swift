//
//  ViewController.swift
//  division
//
//  Created by Icaro Barreira Lavrador on 7/02/16.
//  Copyright © 2016 Swift Next Step. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calculatorBrain = CalculatorBrain()
    let calculOnline    = OnLineCalculatorBrain()
    
    @IBOutlet weak var div1Textfield: UITextField!
    @IBOutlet weak var div2Textfield: UITextField!
    @IBOutlet weak var resutLabel: UILabel!
    @IBAction func calculateButton(sender: AnyObject) {
        if div1Textfield.text != nil && div2Textfield.text != nil{
            if let div1 = Int(div1Textfield.text!){
                if let div2 = Int(div2Textfield.text!){
                    calculatorBrain.divideTwoNumbers(dividend: div1, divisor: div2, completion: { (result, error) -> Void in
                        if error == nil{
                            let numberFormatter = NSNumberFormatter()
                            numberFormatter.numberStyle = .DecimalStyle
                            if let result = result{
                                self.resutLabel.text = numberFormatter.stringFromNumber(result)
                            }
                        }
                    })
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

