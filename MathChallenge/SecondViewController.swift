//
//  SecondViewController.swift
//  MathChallenge
//
//  Created by Matthew Ashley on 9/22/16.
//  Copyright © 2016 Matthew Ashley. All rights reserved.
//

import UIKit
import CloudKit

class SecondViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var randomNumber: Int = Int(arc4random_uniform(109))
    var questionsCorrect: Int = 0
    var count: Int = 6
    var counting: Int = 0
    
    var questionAnswer: String = ""
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        counting = 0
        answerLabel.text = ""
        scoreLabel.text = "0"
        questionLabel.text = LocDbc.getRandomQuestion(randomNumber, correct: 0)
        questionAnswer = LocDbc.getRandomAnswer(randomNumber, correct: 0)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func btn1press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "1")
        
    }

    @IBAction func btn2press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "2")
        
    }
    
    @IBAction func btn3press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "3")
        
    }
    
    @IBAction func btn4press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "4")
        
    }

    @IBAction func btn5press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "5")
        
    }

    @IBAction func btn6press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "6")
        
    }

    @IBAction func btn7press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "7")
        
    }

    @IBAction func btn8press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "8")
        
    }
    
    @IBAction func btn9press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "9")
        
    }
    
    @IBAction func btn0press(_ sender: AnyObject) {
        
        answerLabel.text = (answerLabel.text! + "0")
        
    }
    
    @IBAction func btnClearPress(_ sender: AnyObject) {
        
        answerLabel.text = ""
        
    }
    
    @IBAction func btnEqualPress(_ sender: AnyObject) {
        
        if (answerLabel.text == questionAnswer) {
            
            count = (count + 3)
            
            scoreLabel.text = String(Int(scoreLabel.text!)! + 5)
            
            randomNumber = Int(arc4random_uniform(109))
            
            questionsCorrect = (questionsCorrect + 1)
            
            answerLabel.text = ""
            questionLabel.text = LocDbc.getRandomQuestion(randomNumber, correct: questionsCorrect)
            questionAnswer = LocDbc.getRandomAnswer(randomNumber, correct: questionsCorrect)
            
        }
        
    }
    
    //Displays the timer value!
    func timerAction () {
        
        if (count == 0 && counting == 0) {
            
            let vc: AnyObject! = self.storyboard?.instantiateViewController(withIdentifier: "FinalScore")
            self.show(vc as! UIViewController, sender: vc)
            
            LocDbc.saveScore(scoreLabel.text!)
            
            if (counting == 0) {
                
                LocDbc.addHighScore(scoreLabel.text!)
            
                counting = 1
            }
            
        }
        
        else {
        
            count = (count - 1)
            timeLabel.text = "\(count)"

        }
    }
    
    
}
