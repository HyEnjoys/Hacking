//
//  TrimRectangle.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/9.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct TrimRectangle: View {
    /// 画图形
    @State var completionAmount: CGFloat = 0.0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Rectangle()
            .trim(from: 0, to: completionAmount)
            .stroke(Color.red, lineWidth: 20)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(-90))
            .onReceive(timer) { _ in
                withAnimation {
                    guard self.completionAmount < 1 else {
                        self.timer.upstream.connect().cancel()
                        return
                    }
                    self.completionAmount += 0.25
                }
            }
            .navigationBarTitle("Trim Rectangle")
            .onDisappear {
                self.timer.upstream.connect().cancel()
            }
    }
}

struct TrimRectangle_Previews: PreviewProvider {
    static var previews: some View {
        TrimRectangle()
    }
}
