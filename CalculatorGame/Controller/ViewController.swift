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
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatorBrain.createTask(taskLabel)
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        answerLabel.text?.append(sender.currentTitle!)
        calculatorBrain.checkAnswer(answerLabel, taskLabel)
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if answerLabel.text?.count ?? 0 > 0 {
            answerLabel.text?.removeLast()
            calculatorBrain.checkAnswer(answerLabel, taskLabel)
        }
    }
}

