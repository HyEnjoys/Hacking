//
//  AnyViewPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct AnyViewPage: View {
    var body: some View {
        AnyView(Rectangle().frame(width: 100, height: 100).foregroundColor(.red)).navigationBarTitle("AnyView")
    }
}

#if DEBUG
struct AnyViewPage_Previews: PreviewProvider {
    static var previews: some View {
        AnyViewPage()
    }
}
#endif
