//
//  CalculatorBrain.swift
//  CalculatorGame
//
//  Created by Riccardo Feingold on 31.07.20.
//  Copyright © 2020 Riccardo Feingold. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    let operations = ["+","-","*","/"]
    var correctAnswer = 0
    var score = 0
    var isTrue = false
    
    mutating func createTask(_ taskLabel: UILabel) {
        let firstNumber = Int.random(in: 1...100)
        let secondNumber = Int.random(in: 1...100)
        let operation = Int.random(in: 0...3)
        //let operation = 3
        
        taskLabel.text = "\(firstNumber) \(operations[operation]) \(secondNumber)"
        
        switch (operations[operation]) {
        case "+":
            self.correctAnswer = add(firstNumber, secondNumber)
        case "-":
            self.correctAnswer = minus(firstNumber, secondNumber)
        case "*":
            self.correctAnswer = multiply(firstNumber, secondNumber)
        case "/":
            self.correctAnswer = divide(firstNumber, secondNumber, taskLabel, operation)
        default:
            return
        }
    }
    
    func add(_ numOne: Int, _ numTwo: Int) -> Int {
        return numOne + numTwo
    }
    
    func minus(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
    }
    
    func multiply(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
    }
    
    func divide(_ num1: Int, _ num2: Int, _ taskLabel: UILabel, _ operation: Int) -> Int {
        taskLabel.text = "\(num1) \(operations[operation]) \(num2)"
        if num1 % num2 == 0 {
            return num1 / num2
        } else {
            return self.divide(Int.random(in: 1...100), Int.random(in: 1...100), taskLabel, operation)
        }
    }
}
