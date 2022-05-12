//
//  MaskViewPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct MaskViewPage: View {
    var body: some View {
        Image("icon.swift")
            .resizable()
            .frame(width: 300, height: 300)
            .mask(Text("SWIFT!")
                    .font(Font.system(size: 72).weight(.black)))
            .navigationTitle("Mask")
    }
}

struct MaskViewPage_Previews: PreviewProvider {
    static var previews: some View {
        MaskViewPage()
    }
}
