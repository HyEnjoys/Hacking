//
//  SimultaneousGesturePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct SimultaneousGesturePage: View {
    @State private var offset: CGSize = .zero
    @GestureState var isLongPressed = false
    @State var angle: Angle = Angle(degrees: 0)
    @State var scale: CGFloat = 1
    
    var body: some View {
        // 1
        let longPressAndDrag = LongPressGesture()
            .updating($isLongPressed) { value, state, transition in
                state = value
        }.simultaneously(with: DragGesture()
            .onChanged { self.offset = $0.translation }
            .onEnded { _ in self.offset = .zero }
        )
        
        // 2
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
        let sequenceGesture = SimultaneousGesture(rotationGesture, magnificationGesture)
        
        return VStack {
            Rectangle()
                .fill(isLongPressed ? Color.purple : Color.red)
                .frame(width: 300, height: 300)
                .cornerRadius(8)
                .shadow(radius: 8)
                .padding()
                .scaleEffect(isLongPressed ? 1.1 : 1)
                .offset(x: offset.width, y: offset.height)
                .gesture(longPressAndDrag)
                .animation(.spring())
            
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
                .rotationEffect(angle, anchor: .center)
                .scaleEffect(scale)
                .gesture(sequenceGesture)
        }
    }
}

#if DEBUG
struct SimultaneousGesturePage_Previews: PreviewProvider {
    static var previews: some View {
        SimultaneousGesturePage()
    }
}
#endif
