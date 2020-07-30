//
//  ViewController.swift
//  CalculatorGame
//
//  Created by Riccardo Feingold on 29.07.20.
//  Copyright © 2020 Riccardo Feingold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    //let operations = ["+","-","*","/"]
    let operations = ["+","-","*"]
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createTask()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        answerLabel.text?.append(sender.currentTitle!)
        checkAnswer(userAnswer: Int(answerLabel.text!) ?? 0)
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if answerLabel.text?.count ?? 0 > 0 {
            answerLabel.text?.removeLast()
            checkAnswer(userAnswer: Int(answerLabel.text!) ?? 0)
        }
    }
    
    func checkAnswer(userAnswer: Int) {
        if userAnswer == correctAnswer {
            answerLabel.textColor = .green
            //Add delay function
            answerLabel.text = ""
            createTask()
        }
    }
    
    func createTask() {
        let firstNumber = Int.random(in: 1...100)
        let secondNumber = Int.random(in: 1...100)
        let operation = Int.random(in: 0...2)
        
        taskLabel.text = "\(firstNumber) \(operations[operation]) \(secondNumber)"
        
        switch (operations[operation]) {
        case "+":
            correctAnswer = add(firstNumber, secondNumber)
        case "-":
            correctAnswer = minus(firstNumber, secondNumber)
        case "*":
             correctAnswer = multiply(firstNumber, secondNumber)
        /*case "/":
            correctAnswer = divide(firstNumber, secondNumber)*/
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
    
    /*func divide(_ num1: Int, _ num2: Int) -> Int {
        let answer = Double(num1) / Double(num2)
        if answer.truncatingRemainder(dividingBy: 2.0) == 0 {
            return Int(answer)
        } else {
            createTask()
            return 0
        }
    }*/
}

