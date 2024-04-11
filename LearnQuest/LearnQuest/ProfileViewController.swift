//
//  ProfileViewController.swift
//  LearnQuest
//
//  Created by Pathuri Prameela on 09/04/2024.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarIV: UIImageView!
    
    
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    @IBOutlet weak var mathLBL: UILabel!
    @IBOutlet weak var socialLBL: UILabel!
    @IBOutlet weak var scienceLBL: UILabel!
    @IBOutlet weak var gameLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func logout(_ sender: Any) {
        
        do {
            
            try AuthenticationManager.shared.signOut()
            self.performSegue(withIdentifier: "profileToLogin", sender: self)
            
        } catch {
            
            print("Please try again.")
        }
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
