//
//  RadialGradientPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct RadialGradientPage: View {
    var body: some View {
        // 圆心旋转角度渐变
        ScrollView {
            RadialGradient(gradient: Gradient(colors: [.red, .blue]),
                           center: .center,
                           startRadius: 0,
                           endRadius: 400)
                .frame(width: 300, height: 300)
        }
        .navigationBarTitle("RadialGradient")
    }
}

#if DEBUG
struct RadialGradientPage_Previews: PreviewProvider {
    static var previews: some View {
        RadialGradientPage()
    }
}
#endif
