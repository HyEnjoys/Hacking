//
//  ListPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ListPage: View {
    @State var lists = ["🐶", "🐹", "🐭", "🐱"]
    
    var body: some View {
        List {
            ForEach(lists, id: \.self) {
                Text("\($0)")
            }.onDelete { (offsets) in
                if let first = offsets.first {
                    self.lists.remove(at: first)
                }
            }.onMove { (offset, index) in
                self.lists.move(fromOffsets: offset, toOffset: index)
            }
        }
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle("List")
    }
}

#if DEBUG
struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
        ListPage()
    }
}
#endif
