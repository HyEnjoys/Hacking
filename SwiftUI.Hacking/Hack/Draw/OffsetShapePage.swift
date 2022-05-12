//
//  OffsetShapePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct OffsetShapePage: View {
    var body: some View {
        VStack {
            OffsetShape(shape: Rectangle(),
                        offset: CGSize(width: 100,
                                       height: 100))
                .frame(width: 200, height: 200)
                .foregroundColor(.green)
        }
        .navigationBarTitle("OffsetShape")
    }
}

#if DEBUG
struct OffsetShapePage_Previews: PreviewProvider {
    static var previews: some View {
        OffsetShapePage()
    }
}
#endif
