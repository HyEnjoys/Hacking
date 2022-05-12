//
//  ImagePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

/*
 * 1. 默认情况下，图像视图会自动调整其内容的大小，这可能会使它们超出屏幕范围。 如果添加resizable（）修饰符，则会自动调整图像的大小，使其填充所有可用空间：
 * 2. 然而, 这也可能导致图像的原始宽高比失真, 因为它将在所有维度上被拉伸以使其填充空间所需的任何量。如果要保持其宽高比, 则应使用.fill或.fit添加aspectRatio修饰符
 */

struct ImagePage: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            Image(systemName: "hare").padding()
            // 设置Font
            Image(systemName: "hare").padding().font(.largeTitle)
            
            // 图片原始填充 j可能失真
            Image("icon.catalog")
                .resizable()
            
            // 限定宽高
            Image("icon.catalog")
                .resizable()
                .frame(width: 200, height: 100)
                .padding()
            
            // fit填充 不失真
            Image("icon.catalog")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 100)
                .padding()
            // fit 可能在测试版本无效
            
            /// 图片渲染:
            Image("icon.catalog")
                .resizable()
                .saturation(0.5) // 视图饱和度
                .aspectRatio(contentMode: .fill) // 填充
                .contrast(0.5) // 图像对比度
                .frame(width: 200, height: 200)
                .padding()
            
            // 合并图像
            ZStack {
                Image(systemName: "scribble")
                Image(systemName: "gobackward").blendMode(.overlay)
            }
            .font(.largeTitle)
            .padding(.top, 50)
        }
        .navigationBarTitle(Text("Image"), displayMode: .inline)
    }
}

#if DEBUG
struct ImagePage_Previews: PreviewProvider {
    static var previews: some View {
        ImagePage()
    }
}
#endif
