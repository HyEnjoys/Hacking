//
//  TransformedShapePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct TransformedShapePage: View {
    var elems = ["Scale", "Rotate", "Translate", "None"]
    @State var selection: Int = 0
    
    var body: some View {
        ZStack {
            if selection == 0 {
                // 原始的基础上加上缩放
                TransformedShape(shape: Rectangle(),
                                 transform: CGAffineTransform(scaleX: 3, y: 2))
                    .frame(width: 200, height: 150)
                    .foregroundColor(.purple)
                    .background(Text("scaleX: 2 Y: 2").foregroundColor(.blue))
                    .padding(.bottom, 50)
            } else if selection == 1 {
                // 加上旋转
                TransformedShape(shape: Rectangle(),
                                 transform: CGAffineTransform(rotationAngle: CGFloat.pi/4))
                    .frame(width: 150, height: 150)
                    .foregroundColor(.purple)
                    .background(Text("rotationAngle: pi/4").foregroundColor(.blue))
                    .padding(.bottom, 50)
            } else if selection == 2 {
                // 加上偏移
                TransformedShape(shape: Rectangle(),
                                 transform: CGAffineTransform(translationX: 50, y: 50))
                    .frame(width: 150, height: 150)
                    .foregroundColor(.purple)
                    .background(Text("translationX: 50 y: 50").foregroundColor(.blue))
                    .padding(.bottom, 50)
            } else {
                TransformedShape(shape: Rectangle(),
                                 transform: CGAffineTransform(a: 10, b: 10, c: 10, d: 10, tx: 10, ty: 10))
                .frame(width: 150, height: 150)
                .foregroundColor(.purple)
                    .background(Text("a b c d tx ty: 10").foregroundColor(.blue))
                .padding(.bottom, 50)
            }
            
            Picker(selection: $selection, label: Text("Label")) {
                ForEach(0..<elems.endIndex) {
                    Text(self.elems[$0])
                        .tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 24)
        }
        .navigationBarTitle("TransformShape")
    }
}

#if DEBUG
struct TransformedShapePage_Previews: PreviewProvider {
    static var previews: some View {
        TransformedShapePage()
    }
}
#endif
