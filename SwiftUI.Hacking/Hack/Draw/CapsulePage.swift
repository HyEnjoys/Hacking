//
//  CapsulePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct CapsulePage: View {
    var body: some View {
        ZStack {
            // 胶囊形
            VStack {
                Capsule()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.red)
                    .padding()
                
                Capsule()
                    .frame(width: 100, height: 200)
                    .foregroundColor(.red)
                    .padding()
                
                Capsule()
                    .fill(Color.red)
                    .frame(width: 200, height: 100)
                    // .foregroundColor(.red)
                    .overlay(Rectangle().stroke(Color.white)) // 边框覆盖为白色
                    .padding()
                
                /// 设定背景视图
                HStack {
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.green)
                            .clipShape(Capsule())
                    }
                }
            }
            .accentColor(Color.orange)
            .opacity(0.5)
        }
        .navigationBarTitle("Capsule")
    }
}

#if DEBUG
struct CapsulePage_Previews: PreviewProvider {
    static var previews: some View {
        CapsulePage()
    }
}
#endif
