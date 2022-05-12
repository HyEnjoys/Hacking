//
//  AnimatablePairPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct AnimatablePairPage: View {
    
    @State var color: Color = .green
    @State var scale: CGFloat = 1
    
    var body: some View {
        VStack {
            ColorAndRotate(shape: Rectangle(), color: AnimatablePairPage.ColorAnimate(color: color), rotate: AnimatablePairPage.RotateAnimte(value: scale))
                .frame(width: 200, height: 200)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .padding()
            
            Button("Rotate and Color") {
                self.scale = 1.5
                self.color = .purple
            }.font(.largeTitle)
            
        }.navigationBarTitle("AnimatablePair")
    }
    
    // 组合
    struct ColorAndRotate<S: Shape>: View, Animatable {
        
        var shape: S
        var color: ColorAnimate
        var rotate: RotateAnimte
        
        var animatableData: AnimatablePair<ColorAnimate.AnimatableData, RotateAnimte.AnimatableData> {
            get {
                AnimatablePair(color.animatableData, rotate.animatableData)
            }
            set {
                color.animatableData = newValue.first
                rotate.animatableData = newValue.second
            }
        }
        
        var body: some View {
            shape.scale(rotate.value).foregroundColor(color.color)
        }
    }
    
    // 缩放
    struct RotateAnimte: Animatable {
        var value: CGFloat
        
        var animatableData: CGFloat {
            get {
                value
            }
            set {
                value = newValue
            }
        }
    }
    
    // 颜色
    struct ColorAnimate: Animatable {
        
        var color: Color
        
        var animatableData: Color {
            get {
                color
            }
            set {
                color = newValue
            }
        }
    }
}

#if DEBUG
struct AnimatablePairPage_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairPage()
    }
}
#endif
