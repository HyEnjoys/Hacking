//
//  DragGesturePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct DragGesturePage: View {
    @State var offset: CGSize = .zero
    @State var color: Color = .red
    
    @State var offset1: CGSize = .zero
    @State var color1: Color = .red
    
    var body: some View {
        // minimumDistance: 最小移动距离
        let gesture = DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .onChanged { (value) in
                self.color = .blue
                self.offset = CGSize(width: self.offset.width + value.translation.width, height: self.offset.height + value.translation.height)
        }.onEnded { (value) in
            self.color = .red
            self.offset = CGSize(width: self.offset.width + value.translation.width, height: self.offset.height + value.translation.height)
        }
        let gesture1 = DragGesture(minimumDistance: 10, coordinateSpace: .local)
            .onChanged { (value) in
                self.color = .blue
                self.offset = CGSize(width: self.offset.width + value.translation.width, height: self.offset.height + value.translation.height)
        }
        
        return VStack {
            Circle()
                .fill(color)
                .frame(width: 100, height: 100, alignment: .center)
                .gesture(gesture)
                .offset(offset)
            
            Circle()
                .fill(color1)
                .frame(width: 100, height: 100, alignment: .center)
                .gesture(gesture1)
                .offset(offset1)
            
        }
        .navigationBarTitle("Drag")
    }
}

#if DEBUG
struct DragGesturePage_Previews: PreviewProvider {
    static var previews: some View {
        DragGesturePage()
    }
}
#endif
