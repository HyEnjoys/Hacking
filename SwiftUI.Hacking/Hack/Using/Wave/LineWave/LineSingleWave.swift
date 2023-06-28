//
//  SingleWave.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/6/19.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct LineSingleWave: Shape {
    // 波形的频率，默认为1.2
    var frequency: CGFloat = 1.5
    // 波形的密度，默认为1.0
    var density: CGFloat = 1.0
    // 波形的相位偏移量
    var phase: CGFloat
    // 振幅
    var normedAmplitude: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let maxAmplitude = rect.height / 2.0
        let mid = rect.width / 2
        
        for x in Swift.stride(from:0, to: rect.width + self.density, by: self.density) {
            // Parabolic scaling
            let scaling = -pow(1 / mid * (x - mid), 2) + 1
            let y = scaling * maxAmplitude * normedAmplitude * sin(CGFloat(2 * Double.pi) * self.frequency * (x / rect.width)  + self.phase) + rect.height / 2
            if x == 0 {
                path.move(to: CGPoint(x:x, y:y))
            } else {
                path.addLine(to: CGPoint(x:x, y:y))
            }
        }
        return path
    }
    
    public var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(normedAmplitude, phase)
        }
        set {
            self.normedAmplitude = newValue.first
            self.phase = newValue.second
        }
    }
}
