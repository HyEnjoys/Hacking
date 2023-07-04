//
//  SiriWaveGeometry.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/7/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct Wave {
    
    /// 波形的强度
    var power: CGFloat
    var curves: [Curve]
    var useCurves: Int
    
    static func random(withPower power: CGFloat) -> Wave {
        let numCurves = Int.random(in: 2 ... 4)
        return Wave(
            power: power,
            curves: (0..<4).map { _ in return Curve.random(withPower: power) },
            useCurves: numCurves
        )
    }
}

extension Wave: Identifiable {
    
    var id: String {
        "\(power)\(curves.reduce("") { $0 + $1.id })"
    }
}

/// Animatable不能创建一个数组
extension Wave: Animatable {
    
    typealias AnimatableData = AnimatablePair<
        AnimatablePair<Curve.AnimatableData, Curve.AnimatableData>,
        AnimatablePair<Curve.AnimatableData, AnimatablePair<Curve.AnimatableData, CGFloat>>
    >
    
    var animatableData: AnimatableData {
        get {
            AnimatablePair(
                AnimatablePair(curves[0].animatableData,
                               curves[1].animatableData),
                AnimatablePair(curves[2].animatableData,
                               AnimatablePair(curves[3].animatableData, power))
            )
        }
        set {
            let items = [newValue.first.first,
                         newValue.first.second,
                         newValue.second.first,
                         newValue.second.second.first]
            for (i, item) in items.enumerated() {
                curves[i].amplitude = item.first.first
                curves[i].period    = item.first.second
                curves[i].phase     = item.second
            }
            power = newValue.second.second.second
        }
        
    }
    
}

///
struct Curve {
    // 振幅，表示波形的最大振幅
    var amplitude: CGFloat
    // 波数，控制波形中波峰和波谷的数量
    var period: CGFloat
    // 相位，控制波形在 x 轴上的平移
    var phase: CGFloat
    
    static func random(withPower power: CGFloat) -> Curve {
        return Curve(
            amplitude : CGFloat.random(in: 0.1...1.0),
            period    : CGFloat.random(in: 0.6...0.9),
            phase     : CGFloat.random(in: -1.0...4.0)
        )
    }
}

extension Curve: Identifiable {
    
    var id: String {
        "\(amplitude)\(period)\(phase)"
    }
}

extension Curve: Animatable {
    
    typealias AnimatableData = AnimatablePair<AnimatablePair<CGFloat, CGFloat>, CGFloat>
    
    var animatableData: Curve.AnimatableData {
        get { AnimatablePair(AnimatablePair(amplitude, period), phase) }
        
        set {
            amplitude = newValue.first.first
            period    = newValue.first.second
            phase     = newValue.second
        }
    }
}
