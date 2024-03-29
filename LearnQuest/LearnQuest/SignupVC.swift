//
//  SignupVC.swift
//  LearnQuest
//
//  Created by Prameela on 3/8/24.
//

import UIKit

class SignupVC: UIViewController {

        @IBAction func signup(_ sender: UIButton) {
            guard let username = UsernameTF.text, !username.isEmpty,
                  let password = PasswordTF.text, !password.isEmpty else {
                usernameMsgLBL.text="Username cannot be empty"
                passwordMsgLBL.text="Password cannot empty"
                return
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "SignupToHomepage", sender: nil)
            }

    }
    
    @IBOutlet weak var UsernameTF: UITextField!
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBAction func usernameTF(_ sender: UITextField) {
        if(UsernameTF.text==""){
            usernameMsgLBL.text="Username cannot be empty"
        }
        
    }
    
    @IBAction func passwordTF(_ sender: UITextField) {
        if(PasswordTF.text==""){
            passwordMsgLBL.text="Password cannot empty"
            return
        }
    }
    
    @IBOutlet weak var usernameMsgLBL: UILabel!
    
    @IBOutlet weak var passwordMsgLBL: UILabel!
    
    
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
