//
//  ImagePaintPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ImagePaintPage: View {
    var body: some View {
        Rectangle()
            .fill(ImagePaint(image: Image(uiImage: UIImage(named: "icon.search")!)))
            .navigationBarTitle("ImagePaint")
        // 图片填充
    }
}

#if DEBUG
struct ImagePaintPage_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintPage()
    }
}
#endif
