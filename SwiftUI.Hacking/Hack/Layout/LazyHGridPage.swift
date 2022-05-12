//
//  LazyHGridPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct LazyHGridPage: View {
    let items = 1...10
    
    let rows = [
        GridItem(.fixed(200)),
    ]
    
    var body: some View {
        /// 类似于CollectionView 横向滑动
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(items, id: \.self) { item in
                    Image("Heading\(item)")
                }
            }
        }
        .navigationBarTitle("LazyHGrid")
    }
}

struct LazyHGridPage_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridPage()
    }
}
