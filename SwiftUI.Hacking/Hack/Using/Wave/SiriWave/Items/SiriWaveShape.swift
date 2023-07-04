//
//  SiriWaveShape.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/7/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct SiriWaveShape: Shape {
    
    var wave: Wave
    
    func path(in rect: CGRect) -> Path {
        let geometry = SiriWaveItem(wave, in: rect)
        var path = Path()
        path.move(to: geometry.origin)
        path.addLines(geometry.points)
        return path
    }
    
    var animatableData: Wave.AnimatableData {
        get { return wave.animatableData }
        set { wave.animatableData = newValue }
    }
    
}
