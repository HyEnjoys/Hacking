//
//  ScrollViewPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ScrollViewPage: View {
    let width: CGFloat = 250
    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                HStack {
                    Rectangle().frame(width: width, height: width).foregroundColor(.red)
                    Rectangle().frame(width: width, height: width).foregroundColor(.blue)
                    Rectangle().frame(width: width, height: width).foregroundColor(.green)
                }
            }
            Rectangle().frame(width: width, height: width).foregroundColor(.red)
            Rectangle().frame(width: width, height: width).foregroundColor(.blue)
            Rectangle().frame(width: width, height: width).foregroundColor(.green)
        }
        .navigationBarTitle("ScrollView")
    }
}

#if DEBUG
struct ScrollViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewPage()
    }
}
#endif
