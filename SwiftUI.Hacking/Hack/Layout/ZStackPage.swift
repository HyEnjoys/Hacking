//
//  ZStackPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ZStackPage: View {
    var body: some View {
        ZStack {
            Rectangle().frame(width: 200, height: 200).foregroundColor(.red)
            Rectangle().frame(width: 125, height: 125).foregroundColor(.blue)
            Rectangle().frame(width: 50, height: 50).foregroundColor(.green)
        }
        .navigationBarTitle("ZStack")
    }
}

#if DEBUG
struct ZStackPage_Previews: PreviewProvider {
    static var previews: some View {
        ZStackPage()
    }
}
#endif
