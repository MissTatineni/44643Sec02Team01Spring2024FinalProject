//
//  SplashViewController.swift
//  LearnQuest
//
//  Created by Pathuri Prameela on 01/03/2024.
//

import UIKit
import FirebaseAuth

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        perform(#selector(moveToView), with: nil, afterDelay: 3)
    }
    
    
    @objc func moveToView() -> Void {
        
        if Auth.auth().currentUser == nil {
            
            self.performSegue(withIdentifier: "splashToLogin", sender: self)
        }else {
            
            self.performSegue(withIdentifier: "splashToHome", sender: self)
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
