//
//  GestureImagePage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/11.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct GestureImagePage: View {
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Image("icon.mao")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(scale)
            .gesture(MagnificationGesture()
                        .onChanged { value in
                            print("Scale Change: \(self.scale)  \(value.magnitude)")
                            self.scale = value.magnitude
                            if self.scale > 1 {
                                self.scale *= value.magnitude
                            } else {
                                self.scale = value.magnitude
                            }
                        }
                        .onEnded { _ in
                            if self.scale < 1 {
                                withAnimation {
                                    self.scale = 1
                                }
                            }
                            print("Scale Ended: \(self.scale)")
                        }
            )
            .navigationBarTitle("GestureImage")
    }
    
}

struct GestureImagePage_Previews: PreviewProvider {
    static var previews: some View {
        GestureImagePage()
    }
}
