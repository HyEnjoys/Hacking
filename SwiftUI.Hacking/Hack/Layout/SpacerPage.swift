//
//  SpacerPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct SpacerPage: View {
    var body: some View {
        VStack {
            Rectangle().frame(width: 50, height: 50).foregroundColor(.red)
            
            Spacer()
            
            Rectangle().frame(width: 50, height: 50).foregroundColor(.blue)
            Rectangle().frame(width: 50, height: 50).foregroundColor(.green)
                .padding()
            
            HStack {
                Spacer()
                
                Rectangle().frame(width: 50, height: 50).foregroundColor(.blue)
                Rectangle().frame(width: 50, height: 50).foregroundColor(.green)
            }
        }.navigationBarTitle("Spacer")
    }
}

#if DEBUG
struct SpacerPage_Previews: PreviewProvider {
    static var previews: some View {
        SpacerPage()
    }
}
#endif
