//
//  HomeViewController.swift
//  LearnQuest
//
//  Created by Pathuri Prameela on 09/04/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var activityTV: UICollectionView!
    
    var quizType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "homeToLevel" {
            
            let obj = segue.destination as! LevelsViewController
            obj.quizType = quizType
        }
        
    }
    
    
    @IBAction func home(_ sender: Any) {
        
        
    }
    
    
    @IBAction func math(_ sender: Any) {
        
        self.moveToView(type: "Math")
    }
    
    
    @IBAction func social(_ sender: Any) {
        
        self.moveToView(type: "Social")
    }
    
    @IBAction func science(_ sender: Any) {
        
        self.moveToView(type: "Science")
    }
    
    @IBAction func game(_ sender: Any) {
        
        self.moveToView(type: "Game")
    }
    
    
    func moveToView(type: String) -> Void {
        
        quizType = type
        self.performSegue(withIdentifier: "homeToLevel", sender: self)
    }
}


class Question {
    
    var level: String
    var question: String
    var options: [String]
    var correctAnswer: String
    
    init(level: String, question: String, options: [String], correctAnswer: String) {
        self.level = level
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }
}
