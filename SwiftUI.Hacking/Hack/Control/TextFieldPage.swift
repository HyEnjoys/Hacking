//
//  TextFieldPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct TextFieldPage: View {
    @State var name: String = ""
    @State var password: String = ""
        
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("昵称").foregroundColor(.secondary).padding(20)
                
                TextField(LocalizedStringKey("请填入昵称"), text: self.$name, onEditingChanged: { (changed) in
                    print("onEditing: \(changed)")
                }) {
                    print("userName: \(self.name)")
                    self.endEditing(true)
                }
                .frame(height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle()) /// 设定输入框的样式
                .keyboardType(.decimalPad) /// 设定键盘的样式
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
            }
            
            HStack {
                Text("密码").foregroundColor(.secondary).padding(20)
                /// 密码输入框单独UI
                SecureField(LocalizedStringKey("请填入密码"), text: self.$password) {
                    print("Password: \(self.password)")
                    self.endEditing(true)
                }
                .frame(height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 边框样式
                .keyboardType(.asciiCapable) // 键盘样式
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
            }
            .offset(y: -10)
            
            /// 设定Placeholder的文字大小写, 同时设定Text的大小写 (作用于全部的显示框)
            TextField("Shout your name at me", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textCase(.lowercase)
                        .padding(.horizontal)
            
            Button("Close Key board") {
                self.endEditing(true)
            }
        }
        .navigationBarTitle(Text("TextField"))
        .modifier(DismissingKeyboard())
    }
}

#if DEBUG
struct TextFieldPage_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPage()
    }
}
#endif

// 添加隐藏键盘1
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// 添加隐藏键盘2
extension View {
    func endEditing(_ force: Bool) {
        /// 这种方式的消耗可能比较高
        UIApplication.shared.windows.forEach { $0.endEditing(true)}
    }
}
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

// 添加隐藏键盘3: 已经失效啦
struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
        }
    }
}
