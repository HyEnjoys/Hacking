//
//  EdgePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct EdgePage: View {
    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .foregroundColor(.red)
            .padding(Edge.Set.leading, 100)
            .navigationBarTitle("Edge")
    }
}

#if DEBUG
struct EdgePage_Previews: PreviewProvider {
    static var previews: some View {
        EdgePage()
    }
}
#endif
