//
//  ViewController.swift
//  SpringAppTwo
//
//  Created by Илья on 20.09.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet var springView: SpringView!
    
    @IBOutlet var presenLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var settingBButton: UIButton!
    
    private var counter = 0
    private let animations = Animation.getAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels(animations[0])
        setupView(animations[0])
        
        springView.layer.cornerRadius = 10
    }

    @IBAction func changeButton(_ sender: UIButton) {
        setupAnimation()
        
        settingBButton.setTitle("Run \(animations[counter].presen)", for: .normal)
    }
    
    private func setupAnimation() {
        if counter == animations.count {
            counter = 0
        }
        
        let animation = animations[counter]
        counter += 1
        
        setupView(animation)
        setupLabels(animation)
    }
    
    private func setupLabels(_ sender: Animation) {
        presenLabel.text = "preset: \(sender.presen)"
        curveLabel.text = "curve: \(sender.curve)"
        forceLabel.text = "force: \(String(format: "%.2f", sender.force))"
        durationLabel.text = "duration: \(String(format: "%.2f",sender.duration))"
        delayLabel.text = "delay: \(String(format: "%.2f",sender.delay))"
    }
    
    private func setupView(_ sender: Animation) {
        springView.animation = sender.presen
        springView.curve = sender.curve
        springView.force = sender.force
        springView.duration = sender.duration
        springView.delay = sender.delay
        springView.animate()
    }
}

