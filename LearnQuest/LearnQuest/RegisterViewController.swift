//
//  RegisterViewController.swift
//  LearnQuest
//
//  Created by Pathuri Prameela on 04/03/2024.
//

import UIKit
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
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
    
    @IBAction func register(_ sender: Any) {
        
        if nameTF.text == "" {
            
            self.showAlert(str: "enter name")
        }else if emailTF.text == "" {
            
            self.showAlert(str: "enter email")
        }else if passwordTF.text == "" {
            
            self.showAlert(str: "enter password")
        }else {
            
            SVProgressHUD.show()
            AuthenticationManager.shared.createUser(name: nameTF.text!,
                                                    email: emailTF.text!,
                                                    password: passwordTF.text!) { error, success in
                
                if !success {
                    
                    SVProgressHUD.dismiss()
                    self.showAlert(str: error?.localizedDescription ?? "")
                }else {
                    
                    SVProgressHUD.dismiss()
                    self.dismiss(animated: true)
                }
            }
        }
    }
    

    @IBAction func cancel(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
}


extension UIViewController {
    
    func showAlert(str: String) -> Void {
        
        
        let alert = UIAlertController(title: "", message: str, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
