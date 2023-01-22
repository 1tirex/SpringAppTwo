//
//  DataStor.swift
//  SpringAppTwo
//
//  Created by Илья on 06.10.2022.
//

import SpringAnimation

class DataStor {
    static let shared = DataStor()
    
    let presets = AnimationPreset.allCases.shuffled()
    let curves = AnimationCurve.allCases.shuffled()
    
    private init () {}
}
