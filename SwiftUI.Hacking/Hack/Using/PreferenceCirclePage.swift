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

/// 可以设定宽高相等
struct PreferenceCirclePage: View {
    var body: some View {
        VStack {
            Text("Hello.")
                .padding()
                .modifier(BackgroundModifier())
            Text("Hello World!")
                .padding()
                .modifier(BackgroundModifier())
            Text("Hello World! Good Bye!")
                .padding()
                .modifier(BackgroundModifier())
        }
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

//
struct PreferenceCirclePage1_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceCirclePage()
    }
}

//
struct TextWithCircle: View {
    
    let text: String
    
    @State private var width: CGFloat? = nil
    
    var body: some View {
        Text(text)
            .padding()
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

// 使用二次修订
struct PreferenceCirclePage2: View {
    
    @State private var width: CGFloat? = nil
    
    var body: some View {
        VStack {
            TextWithCircle(text: "Hello")
                .background(GeometryReader { p in
                    Color.clear.preference(key: WidthKey.self, value: p.size.width)
                })
                .onPreferenceChange(WidthKey.self) {
                    self.width = max($0 ?? 0, self.width ?? 0)
                }
                .frame(width: width, height: width)
                .background(Color.orange.opacity(0.25))
            
            TextWithCircle(text: "Hello world.")
                .background(GeometryReader { p in
                    Color.clear.preference(key: WidthKey.self, value: p.size.width)
                })
                .onPreferenceChange(WidthKey.self) {
                    self.width = max($0 ?? 0, self.width ?? 0)
                }
                .frame(width: width, height: width)
                .background(Color.orange.opacity(0.25))
        }
//        .fixedSize(horizontal: true, vertical: false)
    }
}

struct PreferenceCirclePage2_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceCirclePage2()
    }
}
