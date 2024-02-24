//
//  ViewController.swift
//  LearnQuest
//
//  Created by Thirupathi Eluvaka on 2/21/24.
//

import UIKit
import Lottie
import AnimatedGradientView
import AVFoundation
import SpriteKit

class ViewController: UIViewController {
    //Bhargavi Tatineni Start
    @IBOutlet weak var myButton: UIButton!
    let systemSoundID: SystemSoundID = 1111
    //Bhargavi Tatineni End
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let skView = SKView(frame: self.view.frame)
        self.view.addSubview(skView)
    }
    override func viewIsAppearing(_ animated: Bool) {
        self.applyGradientBackground()
    }
    
    //Bhargavi Tatineni Start
    func playSystemSound(soundID: SystemSoundID) {
    AudioServicesPlaySystemSound(soundID)
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
    playSystemSound(soundID: systemSoundID)
     }
    
   

    
    
    //Bhargavi Tatineni End
    

//    @IBOutlet weak var LaunchLAV: LottieAnimationView!{
//        didSet{
//            LaunchLAV.animation = LottieAnimation.named("launch")
//            LaunchLAV.animationSpeed = 1.0
//            LaunchLAV.loopMode = .playOnce
//            LaunchLAV.play{ [weak self] _ in
//                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0.0,options: [.curveEaseInOut]){
//                    self?.LaunchLAV.alpha = 0.0
//                }
//            }
//        }
//    }
    
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
    
    func navigateToPage(pageName: String) {
        if let pageVC = storyboard?.instantiateViewController(withIdentifier: pageName) {
            present(pageVC, animated: true, completion: nil)
        }
    }
    
}

