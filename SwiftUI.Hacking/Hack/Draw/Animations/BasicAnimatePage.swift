//
//  BasicAnimatePage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct BasicAnimatePage: View {
    
    @State private var scale1 = 1.0
    @State private var scale11 = 1.0
    
    @State private var angle: Double = 0
    
    @State private var borderThickness = 1.0
    
    var body: some View {
        ScrollView {
            VStack {
                Button("Animation Scale") { scale1 += 1 }
                    .scaleEffect(scale1)
                    .animation(.linear(duration: 1), value: scale1)
                    .padding()
                
                Button("Animation Scale") { scale11 += 1 }
                    .scaleEffect(scale11)
                    .animation(.easeIn, value: scale11)
                    .padding()
                
                Button("Animation Roate Border") {
                    angle += 45
                    borderThickness += 1
                }
                .padding()
                .border(.red, width: borderThickness)
                .rotationEffect(.degrees(angle))
                .animation(.easeIn, value: angle)
            }
        }
        .navigationBarTitle("Basic")
    }
}

struct BasicAnimatePage_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimatePage()
    }
}
