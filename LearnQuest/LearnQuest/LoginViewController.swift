//
//  LoginViewController.swift
//  LearnQuest
//
//  Created by Pathuri Prameela on 02/03/2024.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func login(_ sender: Any) {
        
        
        validate_login();
        
    }
    
    func validate_login() {
        if emailTF.text == "" {
            self.showAlert(str: "enter email")
        }else if passwordTF.text == "" {
            self.showAlert(str: "enter password")
        }else {
            
            SVProgressHUD.show()
            AuthenticationManager.shared.signIn(email: emailTF.text!,
                                                password: passwordTF.text!) { error, Success in
                if !Success {
                    SVProgressHUD.dismiss()
                    self.showAlert(str: error?.localizedDescription ?? "")
                }else {
                    
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                }
            }
        }
    }
}
