//
//  TextPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

/*
 * bold 加粗
 * italic 倾斜
 * font 大小样式
 * background 背景颜色
 * foregroundColor 文本颜色
 * lineLimit 行数限制
 * lineSpacing 行间距
 * underline 下划线
 * multilineTextAlignment 调整多行对齐
 * padding 边距
 * kerning 调整字间距
 * tracking 调整字间距 分开
 */

import SwiftUI

let github = "https://github.com/Jinxiansen/SwiftUI"

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition
            .move(edge: .bottom)
            .combined(with: .scale(scale: 0.5))
    }
}

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .font(.subheadline)
    }
}

struct TextPage: View {
    
    @AppStorage("MineIndex") var mineIndex: Int = 900
    
    @State var showingWelcome = false
    
    @State private var overText = false
        
    var body: some View {
        ScrollView {
            Text("SwiftYU-::")
                .tracking(20)
                .padding()
            Text("SwiftUI")
                .foregroundColor(.orange)
                .bold()
                .font(.system(.largeTitle))
                .fontWeight(.medium)
                .italic()
                .shadow(color: .black, radius: 1, x: 0, y: 2)
            
            Text(github)
                .underline(true, color: Color.pink) // 下划线
                .font(.system(size: 16, design: .serif))
                .onTapGesture { // 手势触发
                    print("github tap: \(github)")
                }
                .padding()
            
            Text("Views and controls are the visual building blocks of your app’s user interface." +
                " Use them to present your app’s content onscreen.")
                .lineLimit(1) // 行数限制
                .lineSpacing(20) // 行间距
                .truncationMode(.tail) // 截断属性
                .padding()
            
            /// 富文本展示
            Text("SwiftUI ")
                .font(.largeTitle)
                + Text("is ")
                    .font(.headline)
                + Text("awesome")
                    .font(.footnote)
            //            //  foregroundColor() modifier returns a modified view, not a text view, so it can’t be used with +
            //            Text("SwiftUI ")
            //                .foregroundColor(.red)
            //            + Text("is ")
            //                .foregroundColor(.orange)
            //            + Text("awesome")
            //                .foregroundColor(.blue)
            
            /// 把内容进行适配器修改
            Text("Hello, PrimaryLabel").modifier(PrimaryLabel())
            
            /// 图片背景UI
            Text("Hacking with Swift")
                .font(.largeTitle)
                .foregroundColor(.green)
                .background(
                    Image(systemName: "leaf.arrow.circlepath")
                        .resizable()
                        .frame(width: 100, height: 100))
                .padding()
            
            /// 创建背景UI: 例如圆
            Text("Hacking with Swift")
                .font(.largeTitle)
                .background(Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100))
                .padding(.top, 50)
            
            // 默认情况下, 背景视图会自动占用所需的空间,因为需要完全可见
            // Clipped() 可以进行裁剪为父视图的大小
            Text("Hacking with Swift")
                .font(.largeTitle)
                .background(Circle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200))
                .clipped() /// 裁剪
                .padding(.top, 50)
            
            /// hover点击
            /// 在iPad OS进行测试展示.
            Text("Hover")
                .font(.largeTitle)
                .foregroundColor(overText ? Color.red : Color.green)
                .onHover { (over) in
                    self.overText = over
                }
            
            /*
             /// 使用placeholder 隐藏文本
             Text("Test Placeholder")
                 .font(.largeTitle)
                 .redacted(reason: .placeholder)
                 .padding()
             */
        }
        .navigationBarTitle(Text("Text"), displayMode: .inline)
        .onAppear {
            print("Index: \(mineIndex)")
            if mineIndex != 809 {
                mineIndex = 809
            }
        }
    }
}

#if DEBUG
struct TextPage_Previews: PreviewProvider {
    static var previews: some View {
        TextPage()
    }
}
#endif
