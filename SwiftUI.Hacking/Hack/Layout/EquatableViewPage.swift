//
//  EquatableViewPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct EquatableViewPage: View {
    @State var increment1: Int = 0
    @State var increment2: Int = 0
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                HStack(spacing: 0) {
                    Button("left increment ++++") {
                        self.increment1 += 1
                    }
                    .frame(width: geo.size.width/2)
                    .padding()
                    .background(Color.black)
                    
                    Button("right increment") {
                        self.increment2 += 1
                    }
                    .frame(width: geo.size.width/2)
                    .padding()
                    .background(Color.black)
                }
                .fixedSize(horizontal: true, vertical: false)
            }
            
            EquatableView(content: ComparedView(increment1: increment1, increment2: increment2))
        }
    }
}

struct ComparedView: View, Equatable {
    var increment1: Int
    var increment2: Int
    
    static func == (lhs: ComparedView, rhs: ComparedView) -> Bool {
        return lhs.increment1 == rhs.increment2
    }
    
    var body: some View {
        Text("increment1: \(increment1), increment2: \(increment2)")
    }
}

#if DEBUG
struct EquatableViewPage_Previews: PreviewProvider {
    static var previews: some View {
        EquatableViewPage()
    }
}
#endif
