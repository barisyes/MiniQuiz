//
//  ViewController.swift
//  MiniQuiz
//
//  Created by Barış Yeşilkaya on 1.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        starting()
    }

    @IBAction func pressedButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let answerResult = quizBrain.checkAnswer(userAnswer)
        
        if answerResult{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(starting), userInfo: nil, repeats: false)

    }
    
    @objc func starting(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        button1.setTitle(quizBrain.getButtonName(buttonNumber: 1), for: .normal)
        button2.setTitle(quizBrain.getButtonName(buttonNumber: 2), for: .normal)
        button3.setTitle(quizBrain.getButtonName(buttonNumber: 3), for: .normal)
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
    }
    
}

