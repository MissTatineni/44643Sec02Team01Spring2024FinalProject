//
//  SplashViewController.swift
//  LearnQuest
//
//  Created by Pathuri Prameela on 01/03/2024.
//

import UIKit
import FirebaseAuth
import AnimatedGradientView

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
    
    private func applyGradientBackground(){
                let gradientType: CAGradientLayerType = .axial
                let direction: AnimatedGradientViewDirection = .down
                let animatedGradient = AnimatedGradientView(frame: self.view.bounds)
                animatedGradient.animationValues = [
                    (colors: ["ffafbd","cc2b5e"],direction,gradientType),
                    (colors: ["42275a","bdc3c7"],direction,gradientType),
                    (colors: ["de6262","dd5e89"],direction,gradientType),
                    (colors: ["06beb6","2193b0"],direction,gradientType),
                ]
                self.view.insertSubview(animatedGradient, at:0)
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
