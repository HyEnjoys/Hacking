//
//  LazyGridPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct LazyVGridPage: View {
    let data = (1...10).map { "Item \($0)" }
    
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        /// 类似于CollectionView 纵向滑动
        ScrollView {
            ForEach(0..<5) { _ in
                HStack {
                    Text("Heaser")
                        .padding()
                    Spacer()
                }
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .bold().italic().font(.largeTitle)
                            .padding()
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("LazyVGrid")
    }
}

struct LazyVGridPage_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridPage()
    }
}
