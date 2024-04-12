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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayQuestion()
        
        
    }
    
    func displayQuestion() {
            questionLabel.text = quizQuestions[currentQuestionIndex]
            feedbackLabel.text = ""
            answerTextField.text = ""
        }
    
    
    @IBAction func checkAnswer(_ sender: UIButton) {
            let userAnswer = answerTextField.text ?? ""
            let correctAnswer = quizAnswers[currentQuestionIndex]
            
            if userAnswer.lowercased() == correctAnswer.lowercased() {
                feedbackLabel.text = "Correct!"
            } else {
                feedbackLabel.text = "Incorrect. The correct answer is \(correctAnswer)."
            }
        currentQuestionIndex += 1
                if currentQuestionIndex < quizQuestions.count {
                    displayQuestion()
                } else {
                    // End of the quiz
                    currentQuestionIndex = 0 // Reset the question index for next time
                    let alert = UIAlertController(title: "Congratulations!", message: "You have completed the quiz.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
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
