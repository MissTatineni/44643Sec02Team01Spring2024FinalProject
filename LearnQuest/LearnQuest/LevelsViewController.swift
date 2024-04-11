//
//  LevelsViewController.swift
//  LearnQuest
//
//  Created by Pathuri Prameela on 09/04/2024.
//

import UIKit
import FirebaseFirestore
import SVProgressHUD

class LevelsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var scoreLBL: UILabel!
    
    @IBOutlet weak var subjectLBL: UILabel!
    @IBOutlet weak var levelsTV: UICollectionView!
    
    
    var quizType = ""
    var selectedLevel = -1
    
    var quizLevels: [String : Any] = [:]
    var questionsByLevel: [String: [Question]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.getLevels()
        
        levelsTV.delegate = self
        levelsTV.dataSource = self
        levelsTV.backgroundColor = .clear
        
        self.fetchQuestionsFromFirestore()
    }
    
    func fetchQuestionsFromFirestore() {
            let db = Firestore.firestore()
            db.collection(quizType).getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    guard let documents = querySnapshot?.documents else {
                        print("No documents found")
                        return
                    }
                    for document in documents {
                        let data = document.data()
                        let question = Question(
                            level: data["level"] as? String ?? "",
                            question: data["question"] as? String ?? "",
                            options: data["options"] as? [String] ?? [],
                            correctAnswer: data["correct_answer"] as? String ?? ""
                        )
                        if self.questionsByLevel[question.level] == nil {
                            self.questionsByLevel[question.level] = [question]
                        } else {
                            self.questionsByLevel[question.level]?.append(question)
                        }
                    }
                    self.levelsTV.reloadData()
                }
            }
        }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    
    
    
    
    @IBAction func home(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    
    @objc func continueClicked(sender: UIButton) -> Void {
        
        selectedLevel = sender.tag
        self.performSegue(withIdentifier: "levelToQuiz", sender: self)
    }
    
    
    // MARK: - UICollectionViewDataSource
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return questionsByLevel.keys.count
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            let levels = Array(questionsByLevel.keys)
            let level = levels[section]
            return questionsByLevel[level]?.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "levelCell", for: indexPath) as! LevelCVC
            let levels = Array(questionsByLevel.keys)
            let level = levels[indexPath.section]
            let question = questionsByLevel[level]?[indexPath.item]
            //cell.configure(with: question)
            
            cell.contentView.layer.cornerRadius = 8
            cell.contentView.layer.borderColor = UIColor.darkGray.cgColor
            cell.contentView.layer.borderWidth = 2
            
            cell.lockIV.isHidden = true
            cell.contineBTN.isEnabled = true
            
            cell.levelLBL.text = "LEVEL \(indexPath.item + 1)"
            if indexPath.item > 0 {
                
                cell.lockIV.isHidden = false
                cell.contineBTN.isEnabled = false
                
            }
            
            
            cell.contineBTN.tag = indexPath.item
            cell.contineBTN.addTarget(self, action: #selector(continueClicked(sender: )), for: .touchUpInside)
            
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let levels = Array(questionsByLevel.keys)
        let level = levels[indexPath.section]
        let question = questionsByLevel[level]?[indexPath.item]
        print(question?.question)
    }
}
