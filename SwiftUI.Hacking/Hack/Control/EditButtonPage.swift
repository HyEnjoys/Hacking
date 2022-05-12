//
//  EditButtonPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct EditButtonPage: View {
    @State var sizes = ["Short", "Tall", "Grande", "Venti", "Houce", "Main", "Koloyi"]
    
    var body: some View {
        VStack {
            List {
                ForEach(sizes, id: \.self) {
                    Text($0)
                }.onDelete { (indexSet) in
                    self.sizes.remove(atOffsets: indexSet)
                }.onMove { (indexSet, index) in
                    self.sizes.move(fromOffsets: indexSet, toOffset: index)
                }
            }.listStyle(GroupedListStyle())
        }
        .navigationBarTitle("Edit Lists")
        .navigationBarItems(trailing: EditButton())
    }
}

#if DEBUG
struct EditButtonPage_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonPage()
    }
}
#endif
