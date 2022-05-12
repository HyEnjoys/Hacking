//
//  RotatedShapePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct RotatedShapePage: View {
    var body: some View {
        VStack {
            RotatedShape(shape: Rectangle(),
                         angle: Angle(radians: Double.pi/4))
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
                .padding()
            
            RotatedShape(shape: Rectangle(),
                         angle: Angle(radians: Double.pi/4),
                         anchor: .leading)
                .frame(width: 200, height: 200)
                .foregroundColor(.yellow)
                .padding()
        }
        .navigationBarTitle("RotatedShape") // 旋转
    }
}

#if DEBUG
struct RotatedShapePage_Previews: PreviewProvider {
    static var previews: some View {
        RotatedShapePage()
    }
}
#endif
