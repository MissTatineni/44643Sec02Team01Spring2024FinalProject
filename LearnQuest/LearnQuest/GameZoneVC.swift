//
//  GameZoneVC.swift
//  LearnQuest
//
//  Created by Bhargavi Tatineni on 4/12/24.
//

import UIKit

class GameZoneVC: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let quizQuestions = [
        "What color is the sky?",
        "How many legs does a cat have?",
        "What is 2 + 2?"
    ]
    
    let quizAnswers = [
        "Blue",
        "Four",
        "4"
    ]
    
    var currentQuestionIndex = 0
    var score = 0
    var timer: Timer?
    var timeRemaining = 10 // Time in seconds for each question
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        updateScoreLabel()
        startTimer()
    }
    
    func displayQuestion() {
        questionLabel.text = quizQuestions[currentQuestionIndex]
        feedbackLabel.text = ""
        answerTextField.text = ""
    }
    
    func checkAnswer() {
        let userAnswer = answerTextField.text ?? ""
        let correctAnswer = quizAnswers[currentQuestionIndex]
        
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            feedbackLabel.text = "Correct!"
            score += 1
        } else {
            feedbackLabel.text = "Incorrect. The correct answer is \(correctAnswer)."
        }
        currentQuestionIndex += 1
        if currentQuestionIndex < quizQuestions.count {
            displayQuestion()
            resetTimer()
            startTimer()
        } else {
            endQuiz()
        }
        updateScoreLabel()
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "Score: \(score)"
    }
    
    func startTimer() {
        timeRemaining = 10 // Reset time for each question
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeRemaining -= 1
        if timeRemaining == 0 {
            timer?.invalidate()
            checkAnswer()
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
    }
    
    func endQuiz() {
        let alert = UIAlertController(title: "Congratulations!", message: "You have completed the quiz with a score of \(score)!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        score = 0 // Reset score for next time
        currentQuestionIndex = 0 // Reset question index for next time
    }
    
    @IBAction func checkAnswerButtonPressed(_ sender: UIButton) {
        resetTimer()
        checkAnswer()
    }
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
