//
//  ChatModel.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/4/24.
//  Copyright © 2023 Yuan. All rights reserved.
//

import Combine
import SwiftUI

/// 可以作为全局的PreferenceKey来使用
struct LayoutPreferenceKey: PreferenceKey {
    
    static let defaultValue: CGFloat? = nil
    
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

enum MessageType {
    case text(_ text: String)
    case image(_ name: String)
}

struct MessageContentView: View {
    
    let type: MessageType
    
    var body: some View {
        switch type {
        case .text(let text):
            Text(text)
                .foregroundColor(Color.blue.opacity(0.9))
                .fontWeight(.medium)
        case .image(let name):
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue.opacity(0.2))
                .padding(5)
        }
    }
}
// 聊天消息类型
struct ChatMessage: Identifiable {
    let id = UUID()
    let sender: String
    let content: MessageType
}

class ChatViewModel: ObservableObject {
    // 聊天消息列表
    @Published var messages: [ChatMessage] = []
    
    // 发送消息
    func sendMessage(sender: String, content: MessageType) {
        let message = ChatMessage(sender: sender, content: content)
        messages.append(message)
    }
}
