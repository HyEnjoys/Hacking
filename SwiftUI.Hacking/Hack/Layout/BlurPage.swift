//
//  BlurPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

/**
 *  blur() 修改器允许我们根据自己的选择将实时高斯模糊应用于视图。
 *  相当于往视图上面添加很多 radiu大小的黑点, 越大视图越模糊
 */
import SwiftUI

struct BlurPage: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Image("icon.location")
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            
            // 添加一个10点的高斯模糊
            Image("icon.location")
                .resizable()
                .frame(width: 150, height: 150)
                .blur(radius: 10)
                .padding()
            
            Text("Welcome to my SwiftUI app")
                .bold().italic()
                .padding()
            // 添加一个2点的高斯模糊
            Text("Welcome to my SwiftUI app blur")
                .bold().italic()
                .blur(radius: 2)
                .padding()            
        }
    }
}

#if DEBUG
struct BlurPage_Previews: PreviewProvider {
    static var previews: some View {
        BlurPage()
    }
}
#endif
