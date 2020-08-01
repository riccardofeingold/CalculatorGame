//
//  ResultViewController.swift
//  CalculatorGame
//
//  Created by Riccardo Feingold on 01.08.20.
//  Copyright © 2020 Riccardo Feingold. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var scoreString: String?
    
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = scoreString
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }

    @IBAction func restartPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
