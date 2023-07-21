//
//  ViewModifierPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct Green50x50Modifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.green)
            .frame(width: 50, height: 50)
    }
}

struct ViewModifierPage: View {
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .modifier(Green50x50Modifier())
                .navigationBarTitle("ViewModifier")
            
            Text("春眠不觉晓")
                .modifier(TextModifier())
            Text("处处闻啼鸟")
                .modifier(TextModifier())
            Text("夜来风雨声")
                .modifier(TextModifier())
            Text("花落知多少")
                .modifier(TextModifier())
        }
    }
}

#if DEBUG
struct ViewModifierPage_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierPage()
    }
}
#endif
