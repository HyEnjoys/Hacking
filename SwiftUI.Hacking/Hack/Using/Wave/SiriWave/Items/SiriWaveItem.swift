//
//  SiriWaveGeometry.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/7/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

/// 存储点位信息
struct SiriWaveItem {
    
    var wave   : Wave      // Wave 结构体，表示声波的基本属性
    var origin : CGPoint   // 波形的原点位置
    var points : [CGPoint] // 用于存储计算得到的波形点的数组
    
    init(_ wave: Wave, in rect: CGRect) {
        
        self.wave = wave
        self.points = [CGPoint]()
        self.origin = CGPoint(x: 0, y: rect.midY)
        
        // 生成横向坐标点数组
        let xPoints = Array(stride(from: -rect.midX, to: rect.midX, by: 1.0))
        
        // 生成纵向坐标点数组, 此处采用二维数组而不是元组数组主要是因为二维数组的存储方式是一份二维结构, 方式更好的利用了CPU的缓存机制, 从而提高访问速度和执行效率
        var coordinates = [[Double]](repeating: [0.0, 0.0], count: xPoints.count)
        // 计算每个曲线的波形点坐标,
        for i in 0..<self.wave.useCurves {
            let amplitude = self.wave.curves[i].amplitude * Double(rect.midY) * self.wave.power
            var j = 0
            for graphX in xPoints {
                /// 该周期得到的是视图中心范围的数据, 并没有扩散到整体width
                let period = self.wave.curves[i].period * (Double(rect.width) * 0.8)
                let phase  = self.wave.curves[i].phase
                let x = rect.midX + graphX
                let y = self.attn(x: Double(graphX),
                                  amplitude: amplitude,
                                  period: period,
                                  phase: phase) +
                        Double(self.origin.y)
                // 这里使用 max 函数是为了确保波形点的纵坐标不小于前一个曲线所计算的波形点的纵坐标
                coordinates[j] = [Double(x), max(coordinates[j][1], y)]
                j += 1
            }
        }
        
        // 创建反向波形点
        coordinates += coordinates.map({ (coord) -> [Double] in
            return [coord[0], Double(rect.height) - coord[1]]
        })
        
        // 将波形点转换为 CGPoint 类型，并存储到 points 数组中
        self.points += coordinates.map { CGPoint(x: $0[0], y: $0[1]) }
        
    }
    
    /// sine 函数被用于计算波形的垂直方向的值
    /// y = A * sin(Bx + C) + D
    /// A 表示振幅，即波形的最大偏移量；B 表示周期，即波形的一个完整周期所需要的距离；C 表示相位，即波形的起始位置；D 表示波形的纵向偏移量
    /// x 表示波形的横向坐标，amplitude 表示振幅，period 表示周期，phase 表示相位
    private func sine(x: Double, amplitude: Double, period: Double, phase: Double) -> Double {
        return amplitude * sin((2.0 * .pi * x) / period - phase)
    }
    
    /// 这个函数被称为"响度函数"(或 "音量函数")它的作用是在 sine 函数的基础上, 对波形进行一定的调整, 使得波形更符合人耳的感知特性
    /// 具体来说, 响度函数是一个用于计算声音响度的函数, 它是对声音的频率和强度进行调整的函数. 在这里, 我们使用了一个简化版的响度函数, 它被定义为:
    ///   ```
    ///   g(x, t, K, period) = (K / (K + (2πx/period - t)^2))^K
    ///   ```
    /// 其中，x 表示波形中的横坐标，t 表示相位偏移，K 是一个常量，用于控制函数的形状，period 表示波形的周期。这个函数的作用是对 sine 函数的输出进行加权，使得高频部分的波形比低频部分更容易被听到。
    /// 在实际应用中，常量 K 的值通常取决于所需的响度调整程度.
    /// 在这里, 我们将 K 的值设为 4，这是一个经验值, 可以用于产生比较合适的波形效果。如果需要进行更精细的调整，可以尝试不同的 K 值, 并根据实际效果进行调整。
    private func g(x: Double, t: Double, K: Double, period: Double) -> Double {
        let delta = (2.0 * .pi * x / period) - t
        return pow(K / (K + delta * delta), K)
    }
    
    /// x 表示波形的横向坐标，amplitude 表示振幅，period 表示周期，phase 表示相位
    private func attn(x: Double, amplitude: Double, period: Double, phase: Double) -> Double {
        let value = sine(x: x, amplitude: amplitude, period: period, phase: phase)
        let K = 4.0 // A constant value
        // 计算加权参数
        let gValue = g(x: x, t: phase - (Double.pi / 2), K: K, period: period)
        return abs(value * gValue)
    }
    
}

struct Wave: Equatable {
    
    /// 波形的强度
    var power: Double
    var curves: [Curve]
    var useCurves: Int
    
    static func random(withPower power: Double) -> Wave {
        let numCurves = Int.random(in: 2 ... 4)
        return Wave(
            power: power,
            curves: (0..<4).map { _ in return Curve.random(withPower: power) },
            useCurves: numCurves
        )
    }
}

/// Animatable不能创建一个数组
extension Wave: Animatable {
    
    typealias AnimatableData = AnimatablePair<
        AnimatablePair<
            AnimatablePair<
                AnimatablePair<Double, Double>,
                AnimatablePair<Double, Double>
            >,
            AnimatablePair<
                AnimatablePair<Double, Double>,
                AnimatablePair<Double, Double>
            >
        >,
        AnimatablePair<
            AnimatablePair<
                AnimatablePair<Double, Double>,
                AnimatablePair<Double, Double>
            >,
            AnimatablePair<
                AnimatablePair<Double, Double>,
                AnimatablePair<
                    AnimatablePair<Double, Double>,
                    AnimatablePair<Double, Double>
                >
            >
        >
    >
    
    var animatableData: AnimatableData {
        get {
            .init(
                .init(
                    .init(
                        .init(curves[0].amplitude, curves[0].power),
                        .init(curves[0].period, curves[0].phase)),
                    .init(
                        .init(curves[1].amplitude, curves[1].power),
                        .init(curves[1].period, curves[1].phase))),
                .init(
                    .init(
                        .init(curves[2].amplitude, curves[2].power),
                        .init(curves[2].period, curves[2].phase)),
                    .init(
                        .init(curves[3].amplitude, curves[3].power),
                        .init(
                            .init(curves[3].period, curves[3].phase),
                            .init(power, .zero)))))
        }
        set {
            curves[0].amplitude = newValue.first.first.first.first
            curves[0].power = newValue.first.first.first.second
            curves[0].period = newValue.first.first.second.first
            curves[0].phase = newValue.first.first.second.second
            
            curves[1].amplitude = newValue.first.second.first.first
            curves[1].power = newValue.first.second.first.second
            curves[1].period = newValue.first.second.second.first
            curves[1].phase = newValue.first.second.second.second
            
            curves[2].amplitude = newValue.second.first.first.first
            curves[2].power = newValue.second.first.first.second
            curves[2].period = newValue.second.first.second.first
            curves[2].phase = newValue.second.first.second.second
            
            curves[3].amplitude = newValue.second.second.first.first
            curves[3].power = newValue.second.second.first.second
            curves[3].period = newValue.second.second.second.first.first
            curves[3].phase = newValue.second.second.second.first.second
            
            power = newValue.second.second.second.second.first
        }
        
    }
    
}

///
struct Curve: Equatable {
    // 表示波形的强度
    var power: Double
    // 振幅，表示波形的最大振幅
    var amplitude: Double
    // 波数，控制波形中波峰和波谷的数量
    var period: Double
    // 相位，控制波形在 x 轴上的平移
    var phase: Double
    
    static func random(withPower power: Double) -> Curve {
        return Curve(
            power: power,
            amplitude: Double.random(in: 0.1...1.0),
            period: Double.random(in: 0.6...0.9),
            phase: Double.random(in: -1.0...4.0)
        )
    }
}

