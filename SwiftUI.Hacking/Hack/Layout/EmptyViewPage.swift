//
//  EmptyViewPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct EmptyViewPage: View {
    var body: some View {
        EmptyView().navigationBarTitle("Empty")
    }
}

#if DEBUG
struct EmptyViewPage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewPage()
    }
}
#endif
