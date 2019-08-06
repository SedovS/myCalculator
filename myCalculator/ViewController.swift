//
//  ViewController.swift
//  myCalculator
//
//  Created by Apple on 21.05.2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Substact = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {

    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text="0"
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func digits(_ sender: RoundButton) {
        if runningNumber.count <= 18 {
            runningNumber += "\(sender.tag)"
            label.text = runningNumber
        }
    }
  
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        label.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 17 {
            runningNumber += "."
            label.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: RoundButton) {
       operation(operation: .Add)
    }
    @IBAction func substractPressed(_ sender: RoundButton) {
        operation(operation: .Substact)
    }
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL{
            if runningNumber  != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Substact {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                label.text = result
            }
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
        
    }
}

