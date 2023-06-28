//
//  MultiWave.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/6/20.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct LineMultiWave: View {
    // 振幅
    var amplitude: CGFloat = 1.0
    // 波形相位, 初始值0.0
    var phase: CGFloat = 0.0
    
    var color: Color = Color.green
    
    var body: some View {
        ZStack {
            ForEach((0...4), id: \.self) { count in
                singleWave(count: count)
            }
        }
    }
    
    func singleWave(count: Int) -> some View {
        let progress = 1.0 - CGFloat(count) / CGFloat(5)
        let alpha = min(1.0, progress / 3.0 * 2.0 + 1.0 / 3.0)
        let normedAmplitude = (1.5 * progress - 0.8) * amplitude
        
        return LineSingleWave(phase: phase, normedAmplitude: normedAmplitude)
            .stroke(
                LinearGradient(gradient: Gradient(colors: [.green, .cyan, .green]),
                               startPoint: .leading,
                               endPoint: .trailing).opacity(Double(alpha)),
                lineWidth: 1.5 / CGFloat(count + 1)
            )
//            .stroke(color.opacity(Double(alpha)), lineWidth: 1.5 / CGFloat(count + 1))
    }
}

struct LineMultiWave_Previews: PreviewProvider {
    static var previews: some View {
        LineMultiWave()
    }
}

struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {
    
    /// While animating, SwiftUI changes the old input value to the new target value using this property. This value is set to the old value until the animation completes.
    var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }
    
    /// The target value for which we're observing. This value is directly set once the animation starts. During animation, `animatableData` will hold the oldValue and is only updated to the target value once the animation completes.
    private var targetValue: Value
    
    /// The completion callback which is called once the animation completes.
    private var completion: () -> Void
    
    init(observedValue: Value, completion: @escaping () -> Void) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }
    
    /// Verifies whether the current animation is finished and calls the completion callback if true.
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else { return }
        
        /// Dispatching is needed to take the next runloop for the completion callback.
        /// This prevents errors like "Modifying state during view update, this will cause undefined behavior."
        DispatchQueue.main.async {
            self.completion()
        }
    }
    
    func body(content: Content) -> some View {
        /// We're not really modifying the view so we can directly return the original input value.
        return content
    }
}
