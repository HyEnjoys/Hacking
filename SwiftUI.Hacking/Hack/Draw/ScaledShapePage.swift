//
//  ScalePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ScaledShapePage: View {
    var body: some View {
        VStack {
            ScaledShape(
                shape: Rectangle(),
                scale: CGSize(width: 2, height: 2)
            )
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
        }
        .navigationBarTitle("ScaledShape") // 缩放
    }
}

#if DEBUG
struct ScaledShapePage_Previews: PreviewProvider {
    static var previews: some View {
        ScaledShapePage()
    }
}
#endif
