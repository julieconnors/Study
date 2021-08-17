//
//  ViewController.swift
//  calculator
//
//  Created by Luat on 8/16/21.
//

import UIKit

class ViewController: UIViewController {    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var calcDisplay: UILabel!
    
    var firstNum = ""
    var secondNum = ""
    var operation = ""
    var hasOperation = false

    @IBAction func operationButton(_ sender: UIButton) {
        hasOperation = true
        let op = sender.titleLabel?.text ?? ""
        switch op {
            case "/":
                operation = "/"
            case "-":
                operation = "-"
            case "+":
                operation = "+"
            case "X":
                operation = "*"
            default:
                print("no operation")
        }
    }
    
    @IBAction func numButton(_ sender: UIButton) {
        let num = sender.titleLabel?.text ?? ""
        if hasOperation == false {
            firstNum = num
            calcDisplay.text = firstNum
        } else {
            secondNum = num
            calcDisplay.text = secondNum
        }
    }
    @IBAction func equalsButton(_ sender: UIButton) {
        handleOperation()
    }
    
    func handleOperation() {
        let first: Int = Int(firstNum) ?? 0
        let second: Int = Int(secondNum) ?? 0
        var total = 0
        switch operation {
            case "/":
                total = first / second
            case "-":
                total = first - second
            case "+":
                total = first + second
            case "X":
                total = first * second
            default:
                total = 0
        }
        calcDisplay.text = String(total)
        hasOperation = false
    }
}

//    @IBOutlet weak var displayLabel: UILabel!
//
//    @IBAction func numPressed(_ sender: UIButton) {
//        guard let title = sender.titleLabel?.text, let num = Int(title) else {
//            return
//        }
//        if hasOperation == false {
//            firstNum = num
//            print("setting first num")
//        } else if hasOperation == true {
//            secondNum = num
//            print("setting second num")
//        }
//        displayLabel.text = title
//    }
//
//    @IBAction func operationPressed(_ sender: UIButton) {
//        hasOperation = true
//        guard let op = sender.titleLabel?.text else {
//            return
//        }
//        if op == "+" {
//            opStr = op
//            displayLabel.text = op
//        } else if op == "=" {
//            performOperation()
//        }
//
//        print("pressed operation")
//    }
//
//    var firstNum: Int = 0
//    var secondNum: Int = 0
//    var opStr: String = ""
//    var hasOperation = false
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    func performOperation() {
//        hasOperation = false
//        switch opStr {
//        case "+":
//            let result = firstNum + secondNum
//            displayLabel.text = String(result)
//        default:
//            print("Operation not valid")
//        }
//    }
//
//}

