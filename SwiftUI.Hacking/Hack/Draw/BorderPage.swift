//
//  BorderPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct BorderPage: View {
    var body: some View {
        VStack {
            /// 外部boder, 相当于边框从边缘向外侧扩展
            HStack {
                Text("Hacking with Swift")
                    .background(Color.black)
                    .foregroundColor(.white)
                    .padding()
                
                /// 先padding后, 会对padding后的视图进行设定
                Text("Hacking with Swift")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
            }
            
            HStack {
                Text("Hacking with Swift")
                    .border(Color.black)
                
                Text("Hacking with Swift")
                    .padding()
                    .border(Color.black)
            }
            
            HStack {
                Text("Hacking with Swift")
                    .padding()
                    .border(Color.red, width: 4)
                
                Text("Hacking with Swift")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.blue, lineWidth: 4)
                    )
            }
            
            /// 多层级背景视图使用
            Text("Forecast: Sun")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.orange)
                .padding()
                .background(Color.yellow)
            
            HStack {
                /// 内部boder, 相当于边框从边缘向内侧扩展
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 50)
                    .padding()
                
                Circle()
                    .stroke(Color.red, lineWidth: 50)
                    .padding()
            }
        }
    }
}

struct BorderPage_Previews: PreviewProvider {
    static var previews: some View {
        BorderPage()
    }
}
