//
//  ScrollViewReaderPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct ScrollViewReaderPage: View {
    
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to #8") {
                    value.scrollTo(8)
                }
                
                ForEach(0..<10) { i in
                    Text("Example \(i)")
                        .frame(width: 300, height: 150)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
        .navigationBarTitle("ScrollViewReader")
    }
}

struct ScrollViewReaderPage_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderPage()
    }
}
