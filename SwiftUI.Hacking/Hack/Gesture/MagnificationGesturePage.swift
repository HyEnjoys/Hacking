//
//  MagnificationGesturePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct MagnificationGesturePage: View {
    
    @State var scale: CGFloat = 1
    @State var lastScale: CGFloat = 1
    
    var body: some View {
        VStack {
            Image("icon.migration")
                .foregroundColor(.red)
                .scaleEffect(scale) // 缩放
                .aspectRatio(contentMode: .fit)
                .gesture(
                    MagnificationGesture()
                        .onChanged { (value) in
                            print("Magnification Changed: \(self.scale)  \(value)")
                            self.scale = self.lastScale*value.magnitude
                        }
                        .onEnded { (value) in
                            print("Magnification Ended")
                            if self.scale < 1 {
                                withAnimation {
                                    self.scale = 1
                                    self.lastScale = 1
                                }
                            } else {
                                lastScale = self.scale
                            }
                        }
                )
        }
    }
}

#if DEBUG
struct MagnificationGesturePage_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGesturePage()
    }
}
#endif
