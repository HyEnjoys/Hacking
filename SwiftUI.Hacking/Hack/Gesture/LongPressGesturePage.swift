//
//  LongPressGesturePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct LongPressGesturePage: View {
    @GestureState var isDetectingLongPress = false
    @State var longPress = false
    
    var body: some View {
        let press = LongPressGesture(minimumDuration: 1).updating($isDetectingLongPress) { (state, inoutState, transaction) in
            inoutState = state
        }
        
        return VStack {
            Circle()
                .fill(isDetectingLongPress ? Color.yellow : Color.green)
                .frame(width: 100, height: 100, alignment: .center)
                .gesture(press)
                .padding()
            
            Circle()
                .fill(longPress ? Color.yellow : Color.green)
                .frame(width: 100, height: 100, alignment: .center)
                .onLongPressGesture {
                    self.longPress.toggle()
            }
            .padding()
        }.navigationBarTitle("LongPress")
    }
}

#if DEBUG
struct LongPressGesturePage_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesturePage()
    }
}
#endif
