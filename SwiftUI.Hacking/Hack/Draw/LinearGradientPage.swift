//
//  LinearGradientPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct LinearGradientPage: View {
    var body: some View {
        ScrollView {
            // 从左到右渐变
            LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                           startPoint: UnitPoint.leading,
                           endPoint: UnitPoint.trailing)
                .frame(width: 150, height: 150)
                .padding()
            
            // 直上直下的渐变
            LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                           startPoint: UnitPoint(x: 0.5, y: 0),
                           endPoint: UnitPoint(x: 0.5, y: 1))
                .frame(width: 150, height: 150)
                .padding()
            
            // 对角渐变
            LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                           startPoint: UnitPoint(x: 0, y: 0),
                           endPoint: UnitPoint(x: 1, y: 1))
                .frame(width: 150, height: 150)
                .padding()
            
            // 单一颜色渐变
            LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color.red, location: 1)]),
                           startPoint: .leading,
                           endPoint: .trailing)
                .frame(width: 150, height: 150)
                .padding()
        }
        .navigationBarTitle("LinearGradient")
        // 渐变填充
    }
}

#if DEBUG
struct LinearGradientPage_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientPage()
    }
}
#endif
