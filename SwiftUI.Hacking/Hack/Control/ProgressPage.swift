//
//  ProgressPage.swift
//  SwiftUI.lists
//
//  Created by Enjoy on 2019/8/7.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

// 进度展示UI
struct ProgressPage: View {
    
    @State var isShowing: Bool = false
    @Binding var progress: CGFloat
    
    var body: some View {
        // GeometryReader 可以获取当前视图的SIZE
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray)
                    .opacity(0.3)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: self.isShowing ? geometry.size.width * (self.progress / 100.0) : 0.0,
                           height: geometry.size.height)
                    // 
                    .animation(.linear(duration: 0.6))
            }
            .onAppear {
                print("width: \(geometry.size.width)")
                self.isShowing = true
            }
            .cornerRadius(geometry.size.height / 2.0)
        }
    }
}

#if DEBUG
struct ProgressPage_Previews: PreviewProvider {
    static var previews: some View {
        ProgressPage(progress: .constant(25))
    }
}
#endif
