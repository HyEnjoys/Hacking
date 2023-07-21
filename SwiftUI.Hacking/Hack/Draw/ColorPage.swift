//
//  ColorPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI
import UIKit

struct ColorPage: View {
    
    var color = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    
    var body: some View {
        // 颜色填充
        Color(color)
            .ignoresSafeArea()
            .navigationBarTitle("Color")
    }
}

#if DEBUG
struct ColorPage_Previews: PreviewProvider {
    static var previews: some View {
        ColorPage()
    }
}
#endif
