//
//  HStackPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct HStackPage: View {
    var body: some View {
        HStack {
            Rectangle().frame(width: 50, height: 50).foregroundColor(.red)
            Rectangle().frame(width: 50, height: 50).foregroundColor(.blue)
            Rectangle().frame(width: 50, height: 50).foregroundColor(.green)
        }
        .navigationBarTitle("HStack")
    }
}

#if DEBUG
struct HStackPage_Previews: PreviewProvider {
    static var previews: some View {
        HStackPage()
    }
}
#endif
