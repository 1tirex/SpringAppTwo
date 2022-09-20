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
        
        let min = min(
            presets.count,
            curves.count
        )
        
        for index in 0..<min {
            let animation = Animation(
                presen: presets[index].rawValue,
                curve: curves[index].rawValue,
                force: Double.random(in: 1...2),
                duration: Double.random(in: 0...1),
                delay: Double.random(in: 0...1)
            )
            animations.append(animation)
        }
        
        return animations.shuffled()
    }
}
