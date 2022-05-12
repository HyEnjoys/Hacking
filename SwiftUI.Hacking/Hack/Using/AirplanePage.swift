//
//  AirplanePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct AirplanePage: View {
    
    @State var moveCircle: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke()
                .frame(width: 300, height: 300)
                .foregroundColor(Color.yellow)
            
            Image(systemName: "airplane")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .offset(y: -150)
                .rotationEffect(Angle(degrees: moveCircle ? 0 : -360))
                /// autoreverses: 是否回复动画, 就是沿着轨迹重新复位
                /// Animation.linear(duration: 5) 线性动画
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                .onAppear {
                    self.moveCircle.toggle()
                }
        }
    }
}

#if DEBUG
struct AirplanePage_Previews: PreviewProvider {
    static var previews: some View {
        AirplanePage()
    }
}
#endif
