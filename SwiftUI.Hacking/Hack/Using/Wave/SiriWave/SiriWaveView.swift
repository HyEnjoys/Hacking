//
//  SiriWaveView.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/6/28.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct SiriWaveView: View {
    
    var siriWave: SiriWaveObserve
    
    var colors = [
        // Red
        Color(red: (173 / 255), green: (57 / 255), blue: (76 / 255)),
        // Green
        Color(red: (48 / 255), green: (220 / 255), blue: (155 / 255)),
        // Blue
        Color(red: (25 / 255), green: (122 / 255), blue: (255 / 255))
    ]
    
    var supportLineColor: Color = .white
    
    var power: Double = 0.0
    
    init() {
        self.siriWave = SiriWaveObserve(num: self.colors.count, power: self.power)
    }
    
    @discardableResult
    func colors(_ value: [Color]) -> Self {
        var this = self
        if (value.count != this.colors.count) {
            this.siriWave = SiriWaveObserve(num: value.count, power: this.power)
        }
        this.colors = value
        return this
    }
    
    @discardableResult
    func power(_ value: Double) -> Self {
        var this = self
        this.siriWave = SiriWaveObserve(num: self.colors.count, power: value)
        return this
    }
    
    @discardableResult
    func supportLineColor(_ value: Color) -> Self {
        var this = self
        this.supportLineColor = value
        return this
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GeometryReader { geometry in
                    Path { path in
                        let centerY = geometry.size.height / 2.0
                        path.move(to: CGPoint(x: 0, y: centerY))
                        path.addLines([
                            CGPoint(x: 0, y: centerY),
                            CGPoint(x: geometry.size.width, y: centerY)
                        ])
                    }
                    .stroke(supportLineColor, lineWidth: 2)
                    .opacity(0.5)
                }
                ForEach(0..<colors.count, id: \.self) { i in
                    SiriWaveShape(wave: siriWave.waves[i])
                        .fill(colors[i])
                    // .animation(.spring())
                        .animation(.linear(duration: 0.3))
                    // .shadow(color: self.colors[i], radius: 2, x: 0, y: 0)
                }
            }
            // .blendMode(.lighten)
            // .drawingGroup()
        }
    }
}

struct SiriWaveView_Previews: PreviewProvider {
    static var previews: some View {
        SiriWaveView()
    }
}
