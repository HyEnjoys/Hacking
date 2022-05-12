//
//  GroupPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct GroupPage: View {
    var body: some View {
       Group {
            Group {
                Rectangle().frame(width: 50, height: 50).foregroundColor(.red)
                Rectangle().frame(width: 50, height: 50).foregroundColor(.blue)
                Rectangle().frame(width: 50, height: 50).foregroundColor(.green)
            }
            Group {
                Circle().frame(width: 50, height: 50).foregroundColor(.red)
                Circle().frame(width: 50, height: 50).foregroundColor(.blue)
                Circle().frame(width: 50, height: 50).foregroundColor(.green)
            }
        }.navigationBarTitle("Group")
    }
}

#if DEBUG
struct GroupPage_Previews: PreviewProvider {
    static var previews: some View {
        GroupPage()
    }
}
#endif
