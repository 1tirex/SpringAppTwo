//
//  ViewController.swift
//  SpringAppTwo
//
//  Created by Илья on 20.09.2022.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    // MARK: - outlets
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = animations.first?.descriptions
        }
    }
    @IBOutlet var springView: SpringView! {
        didSet {
            springView.layer.cornerRadius = 10
        }
    }

    // MARK: - variables
    private var counter = 0
    private var animations = Animation.getAnimation()

    // MARK: - action
    @IBAction func changeButton(_ sender: UIButton) {
        setupAnimation()
        
        sender.setTitle("Run \(animations[counter].presen)", for: .normal)
    }
    
    // MARK: - private func
    private func setupAnimation() {
        
        let animation = animations[counter]
        counter += 1
        
        descriptionLabel.text = animation.descriptions
        setupView(animation)
        
        if (counter + 1) == animations.count {
            counter = 0
            animations.shuffle()
        }
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

