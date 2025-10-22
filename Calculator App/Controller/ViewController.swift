//
//  ViewController.swift
//  Calculator App
//
//  Created by Softsuave on 17/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var calculatorButtons: [UIButton]!
    var currentInput = ""
    var previousValue = ""
    var currentOperator = "" 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in calculatorButtons {
                button.layer.cornerRadius = button.frame.height / 2
                button.clipsToBounds = true
            }
    }


    @IBAction func buttonsPressed(_ sender: UIButton) {
        if let text=sender.titleLabel?.text{
            switch text {
                    case "0"..."9", ".":
                        currentInput += text
                        resultLabel.text = currentInput
                        
                    case "+", "-", "x", "/" , "%":
                        previousValue = currentInput
                        currentInput = ""
                        currentOperator = text
                        resultLabel.text = currentOperator
                        
                    case "=":
                        if let first = Double(previousValue),
                           let second = Double(currentInput) {
                            var result: Double = 0
                            switch currentOperator {
                            case "+": result = first + second
                            case "-": result = first - second
                            case "x": result = first * second
                            case "/": result = second != 0 ? first / second : 0
                            default: break
                            }
                            
                            resultLabel.text = String(result)
                            
                            currentInput = String(result)
                            previousValue = ""
                            currentOperator = ""
                        }
                        
                    case "C":
                        currentInput = ""
                        previousValue = ""
                        currentOperator = ""
                        resultLabel.text = ""
                        
                    default:
                        break
                    }
        }
    }
}

