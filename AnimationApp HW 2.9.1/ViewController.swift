//
//  ViewController.swift
//  AnimationApp HW 2.9.1
//
//  Created by Александр Манжосов on 26.09.2024.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var springView: SpringView!
    @IBOutlet var springButton: SpringButton!
    @IBOutlet var animationLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    var animations: [Animation] = []
    var countAnim: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animations = DataManager.shared.loadAnimations()
        springView.isHidden = true
        springView.layer.cornerRadius = 10
        springButton.layer.cornerRadius = 10
        springButton.setTitle("Run Animation", for: .normal)
    }

    @IBAction func startSpringBatton(_ sender: SpringButton) {
        
        
        
        if countAnim < 3 {
            springView.isHidden = false
            updateAnimation(anim: animations[countAnim])
            countAnim += 1
        } else {
            updateAnimation(anim: animations[countAnim])
            countAnim = 0
        }
        updateButtonTitle(count: countAnim)
    }
    
}

extension ViewController {
    func updateAnimation(anim: Animation) {
        springView.animation = anim.animation
        springView.curve = anim.curve
        springView.duration = anim.duration
        animationLabel.text = "Animation: \(anim.animation)"
        curveLabel.text = "Curve: \(anim.curve)"
        durationLabel.text = "Duration: \(String(Float(anim.duration)))"
        springView.animate()
    }
    func updateButtonTitle(count: Int) {
        springButton.setTitle("Run \(animations[count].animation)", for: .normal)
    }
}

