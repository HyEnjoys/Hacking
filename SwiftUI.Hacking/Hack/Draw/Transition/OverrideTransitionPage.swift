//
//  OverrideTransitionPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct OverrideTransitionPage: View {
    
    @State private var isZoomed1 = false
    @State private var isZoomed2 = false
    @State private var isZoomed3 = false
    
    var body: some View {
        VStack {
            VStack {
                Button("System Animations") { isZoomed1.toggle() }
                Spacer().frame(height: 20)
                Text("Zoom Text")
                    .font(.title)
                    .scaleEffect(isZoomed1 ? 3 : 1)
                    .animation(.easeInOut(duration: 2), value: isZoomed1)
            }
            Divider()
                .padding()
            VStack {
                Button("Override Animations Transaction") {
                    var transaction = Transaction(animation: .linear)
                    transaction.disablesAnimations = true
                    
                    withTransaction(transaction) {
                        isZoomed2.toggle()
                    }
                }
                Spacer().frame(height: 20)
                Text("Zoom Text")
                    .font(.title)
                    .scaleEffect(isZoomed2 ? 3 : 1)
                    .animation(.easeInOut(duration: 2), value: isZoomed2)
            }
            Divider()
                .padding()
            VStack {
                Button("Toggle Zoom") {
                    var transaction = Transaction(animation: .linear)
                    transaction.disablesAnimations = true
                    
                    withTransaction(transaction) {
                        isZoomed3.toggle()
                    }
                }
                Spacer().frame(height: 50)
                
                Text("Zoom Text 1")
                    .font(.title)
                    .scaleEffect(isZoomed3 ? 3 : 1)
                
                Spacer().frame(height: 50)
                
                Text("Zoom Text 2")
                    .font(.title)
                    .scaleEffect(isZoomed3 ? 3 : 1)
                    .transaction { t in
                        /// 直接关闭动画效果
                        t.animation = .none
                    }
            }
        }
        .navigationBarTitle("Override Aniamtions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OverrideTransitionPage_Previews: PreviewProvider {
    static var previews: some View {
        OverrideTransitionPage()
    }
}
