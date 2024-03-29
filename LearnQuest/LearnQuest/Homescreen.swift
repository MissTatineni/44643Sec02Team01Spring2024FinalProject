//
//  Homescreen.swift
//  LearnQuest
//
//  Created by Prameela on 3/8/24.
//

import UIKit

class Homescreen: UIViewController {

    var score=0;
    
    @IBAction func scoreBTN(_ sender: UIButton) {
        
        score += 1
       // Display an alert with the updated score
        let alertController = UIAlertController(title: "Score", message: "Your score is now \(score)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    @IBAction func H20BTN(_ sender: UIButton) {
    }
    @IBAction func continueBTN(_ sender: Any) {
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
