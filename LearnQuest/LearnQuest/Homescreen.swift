//
//  Homescreen.swift
//  LearnQuest
//
//  Created by Prameela on 3/8/24.
//

import UIKit
import AnimatedGradientView

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
    
    let animalFacts = [
    "Lion": "Lions are the second-largest cats in the world, after tigers.",
    "Elephant": "Elephants are the largest land animals on Earth.",
    "Dolphin": "Dolphins are highly intelligent and social animals that live in groups called pods.",
    "Penguin": "Penguins are flightless birds that live in the Southern Hemisphere.",
    "Kangaroo": "Kangaroos are large marsupials that are native to Australia."
    ]

     @IBAction func showRandomAnimalFact(_ sender: UIButton) {
       // Call the method to show a random animal fact
      showRandomAnimalFact()
    }

     // Add a method to select a random animal and display its fact
     func showRandomAnimalFact() {
       // Select a random animal key
     let animalKeys = Array(animalFacts.keys)
     let randomIndex = Int.random(in: 0..<animalKeys.count)
    let randomAnimal = animalKeys[randomIndex]
      // Display the animal fact
     let animalFact = animalFacts[randomAnimal]!
     let alertController = UIAlertController(title: "Did you know?", message: animalFact, preferredStyle: .alert)
     alertController.addAction(UIAlertAction(title: "OK", style: .default))
     present(alertController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
