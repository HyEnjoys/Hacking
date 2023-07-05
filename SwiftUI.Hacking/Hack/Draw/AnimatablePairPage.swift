//
//  AnimatablePairPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI
import Combine

struct AnimatablePairItem {
    var color: Color
    var scale: CGFloat
}

class AnimatablePairModel: ObservableObject {
    @Published var item = AnimatablePairItem(color: .green, scale: 1.0)
}

struct AnimatablePairPage: View {
    
    @ObservedObject var observe = AnimatablePairModel()
    
    var body: some View {
        VStack {
            ColorAndRotate(shape: Rectangle(),
                           color: AnimatablePairPage.ColorAnimate(color: observe.item.color),
                           scale: AnimatablePairPage.ScaleAnimte(value: observe.item.scale))
            .frame(width: 120, height: 120)
            .padding()
            
            Button("Scale With Color") {
                withAnimation(Animation.easeIn(duration: 1).repeatForever(autoreverses: true)) {
                    self.observe.item = AnimatablePairItem(color: .purple, scale: 1.2)
                }
                // withAnimation { self.observe.item = AnimatablePairItem(color: .purple, scale: 1.2) }
            }
            .font(.largeTitle)
            .padding()
        }
        .navigationBarTitle("AnimatablePair")
    }
    
    // 组合
    struct ColorAndRotate<S: Shape>: View, Animatable {
        
        var shape: S
        var color: ColorAnimate
        var scale: ScaleAnimte
        
        var animatableData: AnimatablePair<ColorAnimate.AnimatableData, ScaleAnimte.AnimatableData> {
            get { AnimatablePair(color.animatableData, scale.animatableData) }
            set {
                color.animatableData = newValue.first
                scale.animatableData = newValue.second
            }
        }
        
        var body: some View {
            shape
                .foregroundColor(color.color)
                .scaleEffect(scale.value)
        }
    }
    
    // 缩放
    struct ScaleAnimte: Animatable {
        
        var value: CGFloat
        
        var animatableData: CGFloat {
            get { value }
            set { value = newValue }
        }
    }
    
    // 颜色
    struct ColorAnimate: Animatable {
        
        var color: Color
        
        var animatableData: Color {
            get { color }
            set { color = newValue }
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
