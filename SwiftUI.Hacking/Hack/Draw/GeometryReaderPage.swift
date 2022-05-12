//
//  GeometryReaderPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct GeometryReaderPage: View {
    var body: some View {
        // 可以得到当前视图的Size
        GeometryReader { proxy in
            Path { (path) in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 20, y: proxy.size.height - 20))
                path.addLine(to: CGPoint(x: proxy.size.width - 20, y: proxy.size.height - 20))
            }
        }
        .foregroundColor(.gray)
        .navigationBarTitle("GeometryReader")
    }
}

#if DEBUG
struct GeometryReaderPage_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderPage()
    }
}
#endif
