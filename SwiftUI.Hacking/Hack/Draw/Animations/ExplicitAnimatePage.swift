//
//  ExplicitAnimatePage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct ExplicitAnimatePage: View {
    
    @State private var opacity = 1.0
    
    var body: some View {
        VStack {
            Button("Press here") {
                withAnimation(Animation.linear(duration: 2)) {
                    opacity -= 0.2
                }
            }
            .font(.title)
            .padding()
            .opacity(opacity)
        }
        .navigationBarTitle("Explicit Animation")
    }
}

struct ExplicitAnimatePage_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimatePage()
    }
}
