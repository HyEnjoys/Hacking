//
//  ViewModifierPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ViewModifierPage: View {
    var body: some View {
        Rectangle()
            .modifier(Green50x50Modifier())
            .navigationBarTitle("ViewModifier")
    }
    
    struct Green50x50Modifier: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.green).frame(width: 50, height: 50)
        }
    }
}

#if DEBUG
struct ViewModifierPage_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierPage()
    }
}
#endif
