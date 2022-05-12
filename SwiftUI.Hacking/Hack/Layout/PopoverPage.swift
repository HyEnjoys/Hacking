//
//  PopoverPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct PopoverPage: View {
    @State var showPop = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showPop = true
                print(self.showPop)
            }) {
                Text("Popover").bold().font(.system(.largeTitle, design: .monospaced))
            }.popover(isPresented: self.$showPop) {
                Text("Popover")
            }
        }.navigationBarTitle("Popover")
    }
}

#if DEBUG
struct PopoverPage_Previews: PreviewProvider {
    static var previews: some View {
        PopoverPage()
    }
}
#endif
