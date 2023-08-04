//
//  SpringAnimatePage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct SpringAnimatePage: View {
    
    @State private var angle1: Double = 0
    @State private var angle2: Double = 0
    
    @State private var scale = 1.0
    
    var body: some View {
        ScrollView {
            VStack {
                Button("Animation Roate 1") {
                    angle1 += 45
                }
                .padding()
                .rotationEffect(.degrees(angle1))
                .animation(.spring(), value: angle1)
                
                Button("Animation Roate 2") {
                    angle2 += 45
                }
                .padding()
                .rotationEffect(.degrees(angle2))
                .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 10), value: angle2)
                
                // ios 17.0
                /*
                 Button("Press here") {
                     scale += 1
                 }
                 .scaleEffect(scale)
                 .animation(.spring(duration: 1, bounce: 0.75), value: scale)
                 */
            }
        }
        .navigationBarTitle("Spring")
    }
}

struct SpringAnimatePage_Previews: PreviewProvider {
    static var previews: some View {
        SpringAnimatePage()
    }
}
