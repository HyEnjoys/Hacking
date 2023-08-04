//
//  CombineTransitionPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

/// Transition动画在Preveiew是, 只能展示removeal动画, insertion无效果, Xcode可能有bug
extension AnyTransition {
    
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
    
    static var moveAndScale: AnyTransition {
        AnyTransition
             .move(edge: .bottom)
             .combined(with: .scale)
    }
    
}

struct CombineTransitionPage: View {
    
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            
            Button("Press") {
                withAnimation(Animation.linear(duration: 2)) {
                    showDetails.toggle()
                }
            }
            .font(.title)
            .padding()
            
            Divider()
            
            if showDetails {
                Text("Opacity Slide")
                    .font(.title)
                    .padding()
                    .transition(AnyTransition.opacity.combined(with: .slide))
                
                Text("Move Scale")
                    .font(.title)
                    .padding()
                    .transition(.moveAndScale)
                
                Text("asymmetric")
                    .font(.title)
                    .padding()
                    .transition(.moveAndFade)
            }
            
            Spacer()
            
        }
        .navigationBarTitle("Combine Transition")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CombineTransitionPage_Previews: PreviewProvider {
    static var previews: some View {
        CombineTransitionPage()
    }
}
