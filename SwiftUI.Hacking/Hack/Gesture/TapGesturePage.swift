//
//  TapGesturePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct TapGesturePage: View {
    @State var color1 = Color.blue
    @State var color2 = Color.green
    
    var body: some View {
        let tap = TapGesture().onEnded { _ in
            self.color1 = self.color1 == .blue ? .red : .blue
        }
        
        return VStack {
            Text("gesture")
            Circle()
                .fill(color1)
                .frame(width: 100, height: 100, alignment: .center)
                .gesture(tap)
                .padding()
            
            Text("onTapGesture")
            Circle()
                .fill(color2)
                .frame(width: 100, height: 100, alignment: .center)
                .contentShape(Rectangle()) /// 修改点击范围, 进而进行点击区域的自定义
                .onTapGesture {
                    self.color2 = self.color2 == .green ? .yellow : .green
                }.padding()
        }
        .navigationBarTitle("Tap")
    }
}


struct GestureMaskPage: View {
    @State var color = Color.blue
    
    var body: some View {
        let tap = TapGesture()
            .onEnded { _ in
                self.color = self.color == .blue ? .red : .blue
            }
        
        return Circle()
            .foregroundColor(color)
            .gesture(tap, including: GestureMask.all)
    }
}


#if DEBUG
struct TapGesturePage_Previews: PreviewProvider {
    static var previews: some View {
        TapGesturePage()
    }
}
#endif
