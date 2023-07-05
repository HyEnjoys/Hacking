//
//  SiriWaveView.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/6/28.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct SiriWaveView: View {
    
    @ObservedObject private var observe = SiriWaveObservable()
        
    @Binding var power: CGFloat
    
    @Binding var lineColor: Color
    
    private var colors = [
        // Red
        Color(red: (173 / 255), green: (57 / 255), blue: (76 / 255)),
        // Green
        Color(red: (48 / 255), green: (220 / 255), blue: (155 / 255)),
        // Blue
        Color(red: (25 / 255), green: (122 / 255), blue: (255 / 255))
    ]
            
    // MARK: - Initiazlier
    init(power: Binding<CGFloat>, lineColor: Binding<Color>) {
        _power = power
        _lineColor = lineColor
    }
    
    @discardableResult
    func colors(_ value: [Color]) -> Self {
        var this = self
        this.observe.update(num: value.count, power: this.power)
        this.colors = value
        return this
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                /// 默认标注线: 可以删除
                GeometryReader { geometry in
                    Path { path in
                        let centerY = geometry.size.height / 2.0
                        path.move(to: CGPoint(x: 0, y: centerY))
                        path.addLines([
                            CGPoint(x: 0, y: centerY),
                            CGPoint(x: geometry.size.width, y: centerY)
                        ])
                    }
                    .stroke(lineColor, lineWidth: 2)
                    .opacity(0.5)
                }
                
                /// 动画线
                ForEach(0..<observe.waves.count, id: \.self) { i in
                    SiriWaveShape(wave: observe.waves[i])
                        .fill(colors[i])
                        .animation(.linear, value: observe.waves[i].id)
                        // .animation(.linear(duration: 0.25))
                }
            }
        }
        .blendMode(.lighten)
        .drawingGroup()
        .onChange(of: power) { value in
            // withAnimation { observe.update(num: colors.count, power: value) }
            observe.update(num: colors.count, power: value)
        }
    }
}

struct SiriWaveView_Previews: PreviewProvider {
    static var previews: some View {
        SiriWaveView(power: .constant(0.0), lineColor: .constant(Color.red))
    }
}
