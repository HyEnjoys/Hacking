//
//  PreferenceCirclePage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2022/4/24.
//  Copyright © 2022 Yuan. All rights reserved.
//

import SwiftUI

struct WidthKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

struct TextWithCircle: View {
    
    @State private var width: CGFloat? = nil
    
    var body: some View {
        Text("Hello World")
            .background(GeometryReader { p in
                Color.clear.preference(key: WidthKey.self, value: p.size.width)
            })
            .onPreferenceChange(WidthKey.self) {
                self.width = $0
            }
            .frame(width: width, height: width)
            .background(Circle().fill(Color.red))
    }
}

struct PreferenceCirclePage: View {
    var body: some View {
        VStack {
            Text("Hello BackModify")
                .modifier(BackgroundModifier())
            Text("Hello BackModify")
                .modifier(BackgroundModifier())
            Text("Hello BackModify")
                .modifier(BackgroundModifier())
        }
    }
}

struct PreferenceCirclePage_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceCirclePage()
    }
}


// 添加隐藏键盘3: 已经失效啦
struct BackgroundModifier: ViewModifier {
    
    @State private var width: CGFloat? = nil
    
    func body(content: Content) -> some View {
        content
            .background(GeometryReader { p in
                Color.clear.preference(key: WidthKey.self, value: p.size.width)
            })
            .onPreferenceChange(WidthKey.self) {
                self.width = $0
            }
            .frame(width: width, height: width)
            .background(Circle().fill(Color.red))
    }
}
