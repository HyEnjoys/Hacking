//
//  EllipsePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct EllipsePage: View {
    var body: some View {
        VStack {
            // 椭圆形
            Ellipse()
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
                .padding()
            
            Ellipse()
                .frame(width: 100, height: 200)
                .foregroundColor(.green)
                .padding()
            
            Ellipse()
                .frame(width: 200, height: 100)
                .foregroundColor(.green)
                .padding()
        }
        .navigationBarTitle("Ellipse")
    }
}

#if DEBUG
struct EllipsePage_Previews: PreviewProvider {
    static var previews: some View {
        EllipsePage()
    }
}
#endif
