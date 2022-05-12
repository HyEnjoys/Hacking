//
//  ExclusiveGesturePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ExclusiveGesturePage: View {
    @State var scale: CGFloat = 1
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        let rotationGesture = RotationGesture(minimumAngleDelta: Angle(degrees: 0)).onChanged { value in
            self.angle = value
        }.onEnded { (value) in
            self.angle = value
        }
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 1)
        .onChanged { (value) in
            self.scale = value
        }
        .onEnded { (value) in
            self.scale = value
        }
        
        
        let exclusiveGesture = ExclusiveGesture(rotationGesture, magnificationGesture)
        return Rectangle()
            .frame(width: 200, height: 200)
            .foregroundColor(.green)
            .rotationEffect(angle, anchor: .center)
            .scaleEffect(scale)
            .gesture(exclusiveGesture)
    }
}

#if DEBUG
struct ExclusiveGesturePage_Previews: PreviewProvider {
    static var previews: some View {
        ExclusiveGesturePage()
    }
}
#endif
