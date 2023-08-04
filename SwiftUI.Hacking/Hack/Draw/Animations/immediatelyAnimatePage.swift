//
//  immediatelyAnimatePage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct immediatelyAnimatePage: View {
    
    @State var scale0 = 1.0
    @State var scale1 = 1.0
    @State var scale2 = 1.0
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 200, height: 200)
                .scaleEffect(scale0)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        scale0 = 0.5
                    }
                }
            
            Circle()
                .frame(width: 200, height: 200)
                .scaleEffect(scale1)
                .animate() { scale1 = 0.5 }
            
            Circle()
                .frame(width: 200, height: 200)
                .scaleEffect(scale2)
                .animateForever(autoreverses: true) { scale2 = 0.5 }
        }
        .navigationBarTitle("Immediately Animate")
    }
}

struct immediatelyAnimatePage_Previews: PreviewProvider {
    static var previews: some View {
        immediatelyAnimatePage()
    }
}

// Create an immediate animation.
extension View {
    func animate(using animation: Animation = .easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}

// Create an immediate, looping animation
extension View {
    func animateForever(using animation: Animation = .easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)
        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}
