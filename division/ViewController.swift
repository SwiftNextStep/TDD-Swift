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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculOnline.calculateWithTwoNumbers(dividend: 10, divisor: 0) { (respose, error) -> () in
            print(error!.domain)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

