//
//  DividerPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct DividerPage: View {
    var body: some View {
        VStack {
            Rectangle().frame(width: 50, height: 50).foregroundColor(.red)
            
            Divider()
            
            Rectangle().frame(width: 50, height: 50).foregroundColor(.blue)
            Rectangle().frame(width: 50, height: 50).foregroundColor(.green)
        }
        .navigationBarTitle("Spacer")
    }
}

#if DEBUG
struct DividerPage_Previews: PreviewProvider {
    static var previews: some View {
        DividerPage()
    }
}
#endif
