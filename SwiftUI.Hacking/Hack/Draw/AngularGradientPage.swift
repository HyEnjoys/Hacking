//
//  AngularGradientPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct AngularGradientPage: View {
    var body: some View {
        ScrollView {
            // 中心渐变
            AngularGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                center: UnitPoint(x: 1, y: 0.5)
            )
                .frame(width: 300, height: 300)
                .padding()
            
            // 中心渐变
            AngularGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                center: .center
            )
                .frame(width: 300, height: 300)
                .padding()
        }
        .navigationBarTitle("AngularGradient")
    }
}

#if DEBUG
struct AngularGradientPage_Previews: PreviewProvider {
    static var previews: some View {
        AngularGradientPage()
    }
}
#endif
