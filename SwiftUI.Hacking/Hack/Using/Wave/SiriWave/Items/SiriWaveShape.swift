//
//  SiriWaveShape.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/7/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct SiriWaveShape: Shape, Equatable {
    static func == (lhs: SiriWaveShape, rhs: SiriWaveShape) -> Bool {
        return lhs.wave.id == rhs.wave.id
    }
    
    var wave: Wave
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLines(calculate(rect))
        return path
    }
    
    var animatableData: Wave.AnimatableData {
        get { return wave.animatableData }
        set { wave.animatableData = newValue }
    }
    
}

// 效果更好一点
extension SiriWaveShape {
    
    private func calculate(_ rect: CGRect) -> [CGPoint] {
        
        // 生成横向坐标点数组
        let xPoints = Array(stride(from: -rect.midX, to: rect.midX, by: 1.0))
        
        // 生成纵向坐标点数组, 此处采用二维数组而不是元组数组主要是因为二维数组的存储方式是一份二维结构, 方式更好的利用了CPU的缓存机制, 从而提高访问速度和执行效率
        var coordinates = [[CGFloat]](repeating: [0.0, 0.0], count: xPoints.count)
        
        // 计算每个曲线的波形点坐标,
        for i in 0..<self.wave.useCurves {
            let amplitude = self.wave.curves[i].amplitude * rect.midY * self.wave.power
            
            for (j, graphX) in xPoints.enumerated() {
                /// 该周期得到的是视图中心范围的数据, 并没有扩散到整体width
                let period = wave.curves[i].period * (CGFloat(rect.width) * 0.8)
                let x = rect.midX + graphX
                let y = attenuate(x: graphX,
                                  amplitude: amplitude,
                                  period: period,
                                  phase: wave.curves[i].phase) + rect.midY
                // 这里使用 max 函数是为了确保波形点的纵坐标不小于前一个曲线所计算的波形点的纵坐标
                coordinates[j] = [x, max(coordinates[j][1], y)]
            }
        }
        
        // 创建反向波形点
        coordinates += coordinates.map { [$0[0], rect.height - $0[1]] }
        
        // 将波形点转换为 CGPoint 类型，并存储到 points 数组中
        let points = coordinates.map { CGPoint(x: $0[0], y: $0[1]) }

        return points
    }
    
    /// sine 函数被用于计算波形的垂直方向的值
    /// y = A * sin(Bx + C) + D
    /// A 表示振幅，即波形的最大偏移量；B 表示周期，即波形的一个完整周期所需要的距离；C 表示相位，即波形的起始位置；D 表示波形的纵向偏移量
    /// x 表示波形的横向坐标，amplitude 表示振幅，period 表示周期，phase 表示相位
    private func sine(x: CGFloat, amplitude: CGFloat, period: CGFloat, phase: CGFloat) -> CGFloat {
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
    private func g(x: CGFloat, t: CGFloat, K: CGFloat, period: CGFloat) -> CGFloat {
        let delta = (2.0 * .pi * x / period) - t
        return pow(K / (K + delta * delta), K)
    }
    
    /// x 表示波形的横向坐标，amplitude 表示振幅，period 表示周期，phase 表示相位
    private func attenuate(x: CGFloat, amplitude: CGFloat, period: CGFloat, phase: CGFloat) -> CGFloat {
        let value = sine(x: x, amplitude: amplitude, period: period, phase: phase)
        let K = 4.0 // A constant value
        // 计算加权参数
        let gValue = g(x: x, t: phase - (CGFloat.pi / 2), K: K, period: period)
        return abs(value * gValue)
    }
}

// 会有视觉差异
extension SiriWaveShape {
    
    private func calculate1(_ frame: CGRect) -> [CGPoint] {
        let xPoints = Array(stride(from: -frame.midX, to: frame.midX, by: 1))
        var coordinates = [[CGFloat]](repeating: [0, 0], count: xPoints.count)
        
        for i in 0..<Int.random(in: 2...wave.curves.count) {
            let amplitude = wave.curves[i].amplitude * frame.midY * wave.power
            
            for (j, graphX) in xPoints.enumerated() {
                let x = graphX / (frame.midX / 9)
                let y = attenuate(x: x, amplitude: amplitude, frequency: wave.curves[i].period, time: wave.curves[i].phase) + frame.midY
                
                coordinates[j] = [frame.midX + graphX, max(coordinates[j][1], y)]
            }
        }
        
        // Create inverse points
        coordinates += coordinates.map { [$0[0], frame.midY - ($0[1] - frame.midY)] }
                
        var points = [CGPoint]()
        for coordinate in coordinates {
            points.append(CGPoint(x: coordinate[0], y: coordinate[1]))
        }
        
        return points
    }

    private func attenuate(x: CGFloat, amplitude: CGFloat, frequency: CGFloat, time: CGFloat) -> CGFloat {
        let sine = amplitude * sin((frequency * x) - time)
        
        let K: CGFloat = 4 //  for the “attenuation equation”
        let globalAmplitude = pow(K / (K + pow((frequency * x) - (time - (CGFloat.pi / 2)), 2)), K)
        
        return abs(sine * globalAmplitude)
    }
}
