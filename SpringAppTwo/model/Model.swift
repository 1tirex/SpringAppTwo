//
//  Model.swift
//  SpringAppTwo
//
//  Created by Илья on 20.09.2022.
//
import UIKit

struct Animation {
    let presen: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    var descriptions: String {
        """
        preset: \(presen)
        curve: \(curve)
        force: \(String(format: "%.2f", force))
        duration: \(String(format: "%.2f", duration))
        delay: \(String(format: "%.2f", delay))
        """
    }
}

extension Animation {
    static func getAnimation() -> [Animation] {
        var animations: [Animation] = []
        
        let min = min(
            DataStor.shared.presets.count,
            DataStor.shared.curves.count
        )
        
        for index in 0..<min {
            let animation = Animation(
                presen: DataStor.shared.presets[index].rawValue,
                curve: DataStor.shared.curves[index].rawValue,
                force: Double.random(in: 1...2),
                duration: Double.random(in: 0.5...1),
                delay: 0.3
            )
            animations.append(animation)
        }
        
        return animations.shuffled()
    }
}
