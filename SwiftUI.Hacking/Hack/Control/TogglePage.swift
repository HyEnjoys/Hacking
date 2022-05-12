//
//  TogglePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct TogglePage: View {
    @State var isShowing = true // toggle state
    
    var body: some View {
        VStack {
            Toggle(isOn: $isShowing) {
                Text("Hello World")
            }
            .padding()
            
            Toggle("Hello World", isOn: $isShowing)
                .padding()
            
            if isShowing {
                Text("Showing")
            }
            
            ///
            Toggle(isOn: .constant(true)) {
                Text("Show advanced options")
            }
        }
    }
}

#if DEBUG
struct TogglePage_Previews: PreviewProvider {
    static var previews: some View {
        TogglePage()
    }
}
#endif
