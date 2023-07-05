//
//  CirclePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct CirclePage: View {
    var body: some View {
        ScrollView {
            /// 圆 只受限制与最短的边
            Circle()
                .frame(width: 200, height: 100)
                .foregroundColor(.green)
            
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
            
            // 半圆
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.5)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
                
                Text("非整圆")
                    .blendMode(.sourceAtop)
                    .foregroundColor(.red)
            }
        }
        .navigationBarTitle("Circle")
    }
}

#if DEBUG
struct CirclePage_Previews: PreviewProvider {
    static var previews: some View {
        CirclePage()
    }
}
#endif
