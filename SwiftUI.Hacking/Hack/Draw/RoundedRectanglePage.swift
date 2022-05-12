//
//  RoundedRectanglePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct RoundedRectanglePage: View {
    var body: some View {
        ScrollView {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .circular)
                .frame(width: 200, height: 200)
                .padding()
            
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .frame(width: 200, height: 200)
                .padding()
            
            RoundedRectangle(cornerRadius: 20, style: .continuous) /// 更加平滑
                .frame(width: 200, height: 200)
                .padding()
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 200, height: 200)
                .padding()
        }
        .navigationBarTitle("RoundedRectangle")
    }
}

#if DEBUG
struct RoundedRectanglePage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectanglePage()
    }
}
#endif
