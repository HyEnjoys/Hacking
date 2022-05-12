//
//  ThemePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/16.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

extension UIViewController {
    var isDarkModeEnabled: Bool {
        get {
            return traitCollection.userInterfaceStyle == .dark
        }
    }
}
// ColorScheme.dark
// ColorScheme.light

struct ThemePage: View {
    var body: some View {
        VStack {
            // 设置light时, 只会在白天模式下正常, 夜间就不正常了
            Text("Color Theme").font(.largeTitle).italic().bold().colorScheme(ColorScheme.light)
            
            Text("Normal Text")
            
        }.navigationBarTitle("ColorScheme")
    }
}

#if DEBUG
struct ThemePage_Previews: PreviewProvider {
    static var previews: some View {
        ThemePage()
    }
}
#endif
