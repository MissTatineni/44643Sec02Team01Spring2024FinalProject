//
//  MathVC.swift
//  LearnQuest
//
//  Created by Prameela on 3/8/24.
//

import UIKit

class MathVC: UIViewController {

    @IBAction func Level02(_ sender: UIButton) {
    }
    @IBAction func Level01(_ sender: UIButton) {
    }
    @IBAction func Level03(_ sender: UIButton) {
    }
    var score=0
    var currentQuestion = 0
    // Add an array to store the questions
    let mathQuestions = [
      (question: "What is 2 + 2?", answer: 4),
    (question: "What is 3 + 3?", answer: 6),
    (question: "What is 4 + 4?", answer: 8),
      ]
    
      @IBAction func scoreBTN(_ sender: UIButton) {
   // Get the user's answer
   let userAnswer = Int(sender.tag)
    
    // Check if the answer is correct
    if userAnswer == mathQuestions[currentQuestion].answer {
       // Increment the score
      score += 1
      }
   
      // Move on to the next question
     currentQuestion += 1
    
     if currentQuestion < mathQuestions.count {
        // Generate a new random question
      let randomIndex = Int.random(in: 0..<mathQuestions.count)
     let newQuestion = mathQuestions[randomIndex]
      // Display the new question
       // You can customize the display to fit your needs
    let questionLabel = UILabel()
      questionLabel.text = newQuestion.question
      questionLabel.sizeToFit()
       view.addSubview(questionLabel)
       // Display the answer buttons
        for i in 0..<4 {
       let button = UIButton(type: .system)
      button.frame = CGRect(x: 50 + CGFloat(i % 2) * 150, y: 200 + CGFloat(i / 2) * 100, width: 100, height: 50)
       button.tag = mathQuestions[randomIndex].answer * 10 + i
       button.setTitle(" \(i + 1)", for: .normal)
        button.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
         view.addSubview(button)
          }
      } else {
        // Display the final score
      let alertController = UIAlertController(title: "Game Over", message: "Your final score is \(score)", preferredStyle: .alert)
      alertController.addAction(UIAlertAction(title: "OK", style: .default))
       present(alertController, animated: true)
    
     // Reset the score and current question
      score = 0
          currentQuestion = 0
     }
     }
  
      @objc func answerTapped(_ sender: UIButton) {
     // Call the scoreBTN function to handle the answer
       scoreBTN(sender)
     }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
