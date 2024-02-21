//
//  ViewController.swift
//  LearnQuest
//
//  Created by Thirupathi Eluvaka on 2/21/24.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var LaunchLAV: LottieAnimationView!{
        didSet{
            LaunchLAV.animation = LottieAnimation.named("launch")
            LaunchLAV.animationSpeed = 1.0
            LaunchLAV.loopMode = .playOnce
            LaunchLAV.play{ [weak self] _ in
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0.0,options: [.curveEaseInOut]){
                    self?.LaunchLAV.alpha = 0.0
                }
            }
        }
    }
    
}

