//
//  DelayAnimatePage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct DelayAnimatePage: View {
    
    @State var rotation = 0.0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 3).delay(1), value: rotation)
                .onTapGesture {
                    rotation += 360
                }
        }
        .navigationBarTitle("Delay")
    }
}

struct DelayAnimatePage_Previews: PreviewProvider {
    static var previews: some View {
        DelayAnimatePage()
    }
}
