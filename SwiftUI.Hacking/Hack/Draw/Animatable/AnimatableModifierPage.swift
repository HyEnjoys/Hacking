//
//  AnimatableModifierPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

// A modifier that animates a font through various sizes.
struct AnimatableCustomFontModifier: ViewModifier, Animatable {
    var name: String
    var size: Double
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}

struct AnimatableSystemFontModifier: ViewModifier, Animatable {
    var size: Double
    var weight: Font.Weight
    var design: Font.Design
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

extension View {
    
    func animatableFont(name: String, size: Double) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
    
    func animatableSystemFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}

struct AnimatableModifierPage: View {
    
    @State private var fontSize1 = 32.0
    @State private var fontSize2 = 32.0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Text Font Modifier One")
                .animatableFont(name: "Georgia", size: fontSize1)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                        fontSize1 = 72
                    }
                }
            
            Rectangle()
                .frame(width: 200, height: 1)
                .foregroundColor(.clear)
                .clipShape(Circle())
            
            Text("Text Font Modifier Two")
                .animatableSystemFont(size: fontSize2)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                        fontSize2 = 72
                    }
                }
        }
        .navigationBarTitle("Modifier")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimatableModifierPage_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableModifierPage()
    }
}
