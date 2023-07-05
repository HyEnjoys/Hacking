//
//  RelativeShapePage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/9.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct RelativeShapePage: View {
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .inset(by: 20)
                .fill(Color.blue)
            Text("Hello, World!")
                .font(.headline)
        }
        .navigationBarTitle("ContainerRelativeShape")
    }
}

struct RelativeShapePage_Previews: PreviewProvider {
    static var previews: some View {
        RelativeShapePage()
    }
}
