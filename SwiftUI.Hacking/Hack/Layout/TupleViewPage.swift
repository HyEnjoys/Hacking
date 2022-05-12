//
//  TupleViewPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct TupleViewPage: View {
    var body: some View {
        TupleView(
            (Rectangle().frame(width: 50, height: 50).foregroundColor(.red),
             Rectangle().frame(width: 50, height: 50).foregroundColor(.blue))
        ).navigationBarTitle("TupleView")
    }
}

#if DEBUG
struct TupleViewPage_Previews: PreviewProvider {
    static var previews: some View {
        TupleViewPage()
    }
}
#endif
