//
//  RectAnglePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct RectAnglePage: View {
    var body: some View {
        
        VStack {
            
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .navigationBarTitle("Rectangle")
            
            /// 合并
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 200, height: 200)
                
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                
                Capsule()
                    .fill(Color.green)
                    .frame(width: 150, height: 100)
                
                Ellipse()
                    .fill(Color.blue)
                    .frame(width: 100, height: 50)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 25)
            }
        }
        .navigationBarTitle("RectAngle")
    }
}

#if DEBUG
struct RectAnglePage_Previews: PreviewProvider {
    static var previews: some View {
        RectAnglePage()
    }
}
#endif
