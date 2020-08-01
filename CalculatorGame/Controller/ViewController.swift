//
//  ViewController.swift
//  CalculatorGame
//
//  Created by Riccardo Feingold on 29.07.20.
//  Copyright © 2020 Riccardo Feingold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var calculatorBrain = CalculatorBrain()
    let totalAmountOfTime = 60
    var amountOfTime = 60
    var countDown = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calculatorBrain.createTask(taskLabel)
        countDown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timer), userInfo: nil, repeats: true)
        calculatorBrain.score = 0
        amountOfTime = 60
        progressBar.progress = 1
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.scoreString = "Score: \(calculatorBrain.score)"
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        answerLabel.text?.append(sender.currentTitle!)
        checkAnswer()
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if answerLabel.text?.count ?? 0 > 0 {
            answerLabel.text?.removeLast()
            checkAnswer()
        }
    }
    
    func checkAnswer() {
        if Int(answerLabel.text ?? "0") == calculatorBrain.correctAnswer {
            answerLabel.textColor = .green
            calculatorBrain.score += 1
            countDown.invalidate()
            scoreLabel.text = "\(calculatorBrain.score)"
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(wait), userInfo: nil, repeats: false)
        }
    }
    
    @objc func timer() {
        amountOfTime -= 1
        if amountOfTime + 1 > 0 {
            let progress = Float(amountOfTime)/Float(totalAmountOfTime)
            progressBar.progress = progress
        } else {
            countDown.invalidate()
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    
    @objc func wait() {
        countDown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timer), userInfo: nil, repeats: true)
        answerLabel.text = ""
        answerLabel.textColor = .white
        calculatorBrain.createTask(taskLabel)
    }
}

