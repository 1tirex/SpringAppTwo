//
//  Model.swift
//  SpringAppTwo
//
//  Created by Илья on 20.09.2022.
//
import UIKit
import SpringAnimation

struct Animation {
    let presen: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
}

extension Animation {
    static func getAnimation() -> [Animation] {
        var animations: [Animation] = []
        
        let presets = AnimationPreset.allCases.shuffled()
        let curves = AnimationCurve.allCases.shuffled()
        
        for (preset, curve) in zip(presets, curves) {
            let animation = Animation(
                presen: preset.rawValue,
                curve: curve.rawValue,
                force: Double.random(in: 1...2),
                duration: Double.random(in: 0...1),
                delay: Double.random(in: 0...1)
            )
            animations.append(animation)
        }
        
        return animations.shuffled()
    }
}
