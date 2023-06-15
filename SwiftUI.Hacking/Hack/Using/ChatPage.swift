//
//  ChatPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/4/24.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

// MARK: - Preview
struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}

// MARK: - UI
struct ChatPage: View {
    @StateObject var viewModel = ChatViewModel()
    @State var messageText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(viewModel.messages) { message in
                        ChatMessageView(message: message, isFromCurrentUser: message.sender == "Me")
                    }
                }
                
                HStack {
                    TextField("Message", text: $messageText, onCommit: {
                        viewModel.sendMessage(sender: "Me", content: .text(messageText))
                        messageText = ""
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                    
                    Button(action: {
                        viewModel.sendMessage(sender: "Me", content: .text(messageText))
                        messageText = ""
                    }, label: {
                        Text("Send")
                    })
                    .disabled(messageText.isEmpty)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                }
                .padding()
                .background(Color.gray.opacity(0.2))
            }
            .onAppear {
                viewModel.sendMessage(sender: "Alice", content: .text("Hello, I'm Alice, nice to meet yoiu!"))
                viewModel.sendMessage(sender: "Me", content: .text("Hello，I'm Gost"))
                viewModel.sendMessage(sender: "Alice", content: .image("ic_dog_sitting"))
                viewModel.sendMessage(sender: "Me", content: .text("So, what can I help?"))
                viewModel.sendMessage(sender: "Alice", content: .text("I can't asleep naturally, can you give me some advertisements? So kind of you!"))
                viewModel.sendMessage(sender: "Me", content: .image("ic_dog_play"))
                viewModel.sendMessage(sender: "Alice", content: .text("Yes, but it didn't take effect."))
            }
            .navigationTitle("Chat")
        }
    }
}

// MARK: - 聊天头像
struct AvatarView: View {
    
    let systemName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemName)
                .resizable(resizingMode: .stretch)
                .foregroundColor(Color.red.opacity(0.6))
                .padding(10)
                .background(Circle().foregroundColor(Color.orange).opacity(0.2))
                .frame(width: 50, height: 50)
            
            Spacer()
        }
    }
}

// MARK: - 聊天消息视图
struct ChatMessageView: View {
    var message: ChatMessage
    var isFromCurrentUser: Bool
    
    @State private var height: CGFloat? = nil
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
            } else {
                AvatarView(systemName: "figure.walk")
                    .padding(.leading, 5)
            }
            MessageContentView(type: message.content)
                .padding()
                .modifier(ChatBubbleStyle(isFromCurrentUser: isFromCurrentUser))
                .padding(EdgeInsets(top: 0, leading: isFromCurrentUser ? 10 : 0, bottom: 0, trailing: isFromCurrentUser ? 0 : 10))
            
            if !isFromCurrentUser {
                Spacer()
            } else {
                AvatarView(systemName: "airplane")
                    .padding(.trailing, 5)
            }
        }
        .onPreferenceChange(LayoutPreferenceKey.self) {
            self.height = max(self.height ?? 0, $0 ?? 0)
        }
        .padding(.bottom, 5)
    }
    
}

// MARK: - 聊天气泡样式
struct ChatBubbleStyle: ViewModifier {
    var isFromCurrentUser: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
            .foregroundColor(.black)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.orange.opacity(0.8)))
    }
}


// MARK: - 聊天气泡: BUG
struct ChatBubble: Shape {
    
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let radius: CGFloat = 16
        let arrowWidth: CGFloat = 10
        let arrowHeight: CGFloat = 10
        
        let x: CGFloat = isFromCurrentUser ? rect.maxX - radius : rect.minX + radius
        let y: CGFloat = rect.midY
        
        var path = Path()
        path.addArc(center: CGPoint(x: x, y: y), radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 90), clockwise: true)
        path.move(to: CGPoint(x: x, y: rect.midY - radius))
        if isFromCurrentUser {
            path.addLine(to: CGPoint(x: rect.minX + arrowWidth + radius, y: rect.midY + arrowHeight))
            path.addLine(to: CGPoint(x: rect.minX + arrowWidth + radius, y: rect.maxY - radius))
        } else {
            path.addLine(to: CGPoint(x: rect.maxX - arrowWidth - radius, y: rect.midY - radius))
            path.addLine(to: CGPoint(x: rect.maxX - arrowWidth - radius, y: rect.midY + radius))
            path.addLine(to: CGPoint(x: x, y: rect.midY + radius))
        }
        
        path.addArc(center: CGPoint(x: x, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
        
        //        if isFromCurrentUser {
        //            path.addArc(center: CGPoint(x: rect.minX + arrowWidth + radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: false)
        //            path.addLine(to: CGPoint(x: rect.minX + arrowWidth, y: rect.maxY))
        //            path.addLine(to: CGPoint(x: rect.minX + arrowWidth, y: rect.maxY - radius - arrowHeight))
        //        } else {
        //            path.addArc(center: CGPoint(x: rect.maxX - arrowWidth - radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        //            path.addLine(to: CGPoint(x: rect.maxX - arrowWidth, y: rect.maxY))
        //            path.addLine(to: CGPoint(x: rect.maxX - arrowWidth, y: rect.maxY - radius - arrowHeight))
        //        }
        //
        //        path.addArc(center: CGPoint(x: x, y: rect.maxY - radius - arrowHeight), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 270), clockwise: false)
        
        //        path.closeSubpath()
        
        return path
    }
}
