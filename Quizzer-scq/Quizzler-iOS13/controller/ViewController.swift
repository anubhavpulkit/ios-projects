//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questions: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var progrssBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    var Quizbrain = quizBrain()
    
    var secondsRemaining = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //questions.text = quiz[questionNumber].question
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerTrue(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotRight = Quizbrain.checkAnswer(userAnswer)
        
        if userGotRight {
            print("Right!")
            sender.backgroundColor = UIColor.green
            print(Quizbrain.checkAnswer(userAnswer))
        }
        else{
            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        Quizbrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // updateUI()
    
    
    @objc func updateUI() {
        
        questions.text = Quizbrain.questionsForDisplay()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "\(Quizbrain.getscore())"
        progrssBar.progress = Quizbrain.getProgress()
    }
    
    
}

