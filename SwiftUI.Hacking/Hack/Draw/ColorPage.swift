//
//  ColorPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ColorPage: View {
    var body: some View {
        Color
            .green
            .navigationBarTitle("Color")
        // 颜色填充
    }
}

#if DEBUG
struct ColorPage_Previews: PreviewProvider {
    static var previews: some View {
        ColorPage()
    }
}
#endif
