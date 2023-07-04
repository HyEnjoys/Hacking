//
//  DynamicStackPage.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/3/30.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct DynamicStackPage: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if #available(iOS 16.0, *) {
            let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
            layout {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .font(.largeTitle)
        }  
    }
}

struct DynamicStackPage_Previews: PreviewProvider {
    static var previews: some View {
        DynamicStackPage()
    }
}
