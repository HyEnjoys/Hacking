//
//  AnimatablePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct AnimatablePage: View {
    
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            // repeatForever 动画永远执行
            ColorAnimate(shape: Rectangle(), color: color)
                .animation(.easeIn(duration: 1).repeatForever(autoreverses: true))
                .frame(width: 200, height: 200)
                .padding()
            
            Button("Animation") {
                self.color = .blue
            }
            .font(.largeTitle)
        }
        .navigationBarTitle("Basic")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    struct ColorAnimate<S: Shape>: View, Animatable {
        
        var shape: S
        var color: Color
        
        // 父类属性
        var animatableData: Color {
            get { color }
            set { color = newValue }
        }
        
        var body: some View {
            shape.foregroundColor(color)
        }
    }
}

#if DEBUG
struct AnimatablePage_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePage()
    }
}
#endif
