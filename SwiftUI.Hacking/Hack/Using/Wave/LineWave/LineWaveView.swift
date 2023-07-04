//
//  WaveView.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/6/19.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct LineWaveView: View {
    
    @State var level     : CGFloat = 0.5
    @State var phase     : CGFloat = 0.0
    @State var amplitude : CGFloat = 0.01
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            LineMultiWave(amplitude: amplitude, phase: phase, color: .green)
                .frame(height: 250)
//                .onAppear {
//                    withAnimation(Animation.linear(duration: 0.1).repeatForever(autoreverses: false)) {
//                        self.amplitude = max(CGFloat(arc4random_uniform(700)) / 1000.0, 0.01)
//                        self.phase -= 1.5
//                    }
//                }
//                .modifier(AnimationCompletionObserverModifier(observedValue: amplitude, completion: {
//                    withAnimation(.linear(duration: 0.1)){
//                        self.amplitude = max(CGFloat(arc4random_uniform(700)) / 1000.0, 0.01)
//                        self.phase -= 1.5
//                    }
//                }))
        }
        .onReceive(timer) { _ in
            let value = max(CGFloat(arc4random_uniform(700)) / 1000.0, 0.01)
            withAnimation(Animation.linear(duration: 0.1)) {
                amplitude = value
            }
        }
        .navigationBarTitle("line Wave")
    }
}

struct LineWaveView_Previews: PreviewProvider {
    static var previews: some View {
        LineWaveView()
    }
}
