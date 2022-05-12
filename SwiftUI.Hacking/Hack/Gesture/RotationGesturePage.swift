//
//  RotationGesturePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct RotationGesturePage: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        let gesture = RotationGesture(minimumAngleDelta: Angle(degrees: 0))
            .onChanged { (angle) in
                print("RotationGesture change angle: \(angle.degrees)")
                self.angle = angle
        }.onEnded { (angle) in
            print("RotationGesture ended angle: \(angle.degrees)")
            self.angle = angle
        }
        return VStack {
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.yellow)
                .rotationEffect(angle, anchor: .center)
                .gesture(gesture)
            
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.yellow)
                .rotationEffect(angle, anchor: .center)
                .gesture(gesture)
        }
    }
}

#if DEBUG
struct RotationGesturePage_Previews: PreviewProvider {
    static var previews: some View {
        RotationGesturePage()
    }
}
#endif
