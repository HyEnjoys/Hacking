//
//  DashlinePage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/7/5.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct DashlinePage: View {
    var body: some View {
        ScrollView {
            
            Circle()
                .stroke(Color.red,
                        style: StrokeStyle(lineWidth: 20, dash: [2, (2 * .pi * 100)/12 - 2]))
                .rotationEffect(Angle(degrees: -90))
                .frame(height: 200) // radiu = 100
                .padding()
            
            Text("Hello, World!")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style: StrokeStyle(dash: [8, 4]))
                )
                .padding()
            
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red, style: .init(lineWidth: 5, dash: [10, 5]))
                .frame(width: 150, height: 150)
                .padding()
            
            Circle()
                .stroke(Color.red, style: .init(lineWidth: 5, dash: [10, 5]))
                .frame(width: 150, height: 150)
                .padding()
                        
            Ellipse()
                .stroke(Color.red, style: .init(lineWidth: 5, dash: [10, 5]))
                .frame(width: 150, height: 100)
            
            Capsule()
                .stroke(Color.red, style: .init(lineWidth: 5, dash: [10, 5]))
                .frame(width: 150, height: 100)
                .padding()
                        
        }
        .navigationTitle("Dash Line")
    }
}

struct DashlinePage_Previews: PreviewProvider {
    static var previews: some View {
        DashlinePage()
    }
}
