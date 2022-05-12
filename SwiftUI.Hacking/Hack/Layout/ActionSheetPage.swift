//
//  ActionSheetPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ActionSheetPage: View {
    @State var isShow: Bool = false
    var body: some View {
        Button(action: {
            self.isShow.toggle()
        }) {
            Text("Show Sheet").bold().italic().font(.largeTitle)
        }.actionSheet(isPresented: self.$isShow) {
            ActionSheet(title: Text("Title"), message: Text("Message"), buttons:
                [ActionSheet.Button.destructive(Text("destructive"), action: {
                    print("destructive")
                }),
                 ActionSheet.Button.default(Text("Default"), action: {
                    print("Default")
                 }),
                 ActionSheet.Button.cancel(Text("Cancel"), action: {
                    print("Cancel")
                 })
                ]
            )
        }
        .navigationBarTitle("ActionSheet")
    }
}

#if DEBUG
struct ActionSheetPage_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetPage()
    }
}
#endif
