//
//  PageRow.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct PageRow: View {
    
    var image: String = "questionmark.circle"
    var name: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.title)
                .frame(width: 35, height: 35)
                .padding(10)
            Text(name)
                .font(Font.system(size: 16))
        }
    }
}

#if DEBUG
struct PageRow_Previews: PreviewProvider {
    static var previews: some View {
        PageRow(name: "Test")
    }
}
#endif
