//
//  DisplayScore.swift
//  LearnQuest
//
//  Created by Prameela on 3/8/24.
//

import UIKit
import AnimatedGradientView

class DisplayScore: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createNewAccount(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "profilePageToSignUp", sender: nil)
        }
    }
    
    @IBAction func ChangeAvator(_ sender: UIButton) {
    }
    
    
    private func applyGradientBackground(){
        let gradientType: CAGradientLayerType = .axial
        let direction: AnimatedGradientViewDirection = .up
        let gradient = AnimatedGradientView(frame: self.view.bounds)
        gradient.animationValues = [
            (colors: ["#90EE90", "#DCD3F3"], direction, gradientType),
            (colors: ["#ADD8E6", "#E9F3F2"], direction, gradientType),
            (colors: ["#DCD3F3", "#90EE90"], direction, gradientType),
            (colors: ["#E9F3F2", "#ADD8E6"], direction,gradientType)
        ]
        self.view.insertSubview(gradient, at: 0)
        
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
