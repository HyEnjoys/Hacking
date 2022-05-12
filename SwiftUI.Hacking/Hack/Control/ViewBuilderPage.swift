//
//  ViewBuilderPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ViewBuilderPage: View {
    var body: some View {
        ViewBuilder.buildBlock(
            Rectangle().frame(width: 100, height: 100).foregroundColor(.red),
            Rectangle().frame(width: 100, height: 100).foregroundColor(.blue)
        ).navigationBarTitle("ViewBuilder")
    }
}

#if DEBUG
struct ViewBuilderPage_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderPage()
    }
}
#endif
