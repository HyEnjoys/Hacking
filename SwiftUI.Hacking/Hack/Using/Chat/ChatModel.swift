//
//  ChatModel.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/4/24.
//  Copyright © 2023 Yuan. All rights reserved.
//

import Combine
import SwiftUI
import MarkdownUI

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
            if #available(iOS 15.0, *) {
                MarkdownUI.Markdown(text)
                    .markdownTheme(.gitHub)
//                if text.contains("```") {
//                    MarkdownUI.Markdown(text)
//                } else {
//                    Text(text)
//                        .foregroundColor(Color.blue.opacity(0.9))
//                        .fontWeight(.medium)
//                        .textSelection(.enabled)
//                }
            } else {
                Text(text)
                    .foregroundColor(Color.blue.opacity(0.9))
                    .fontWeight(.medium)
                    .contextMenu {
                        /// 文本复制
                        Button(action: { UIPasteboard.general.string = text }) {
                            Text("Copy")
                            Image(systemName: "doc.on.doc")
                        }
                    }
            }
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

var ChatMarkText: String {
        """
        ## Supported Platforms
        
        - iOS/tvOS 15 and above
        - macOS 12 and above
        - watchOS 8 and above
        - Linux
        
        ## Installation
        
        ### Swift Package Manager
        - File > Swift Packages > Add Package Dependency
        - Add https://github.com/alfianlosari/ChatGPTSwift.git
        
        ### Cocoapods
        ```ruby
        platform :ios, '15.0'
        use_frameworks!
        
        target 'MyApp' do
          pod 'ChatGPTSwift', '~> 1.3.1'
        end
        ```
        
        ## Requirement
        
        Register for API key from [OpenAI](https://openai.com/api). Initialize with api key
        
        ```swift
        let api = ChatGPTAPI(apiKey: "API_KEY")
        ```
        
        ## Usage
        
        There are 2 APIs: stream and normal
        
        ### Stream
        
        The server will stream chunks of data until complete, the method `AsyncThrowingStream` which you can loop using For-Loop like so:
        
        ```swift
        Task {
            do {
                let stream = try await api.sendMessageStream(text: "What is ChatGPT?")
                for try await line in stream {
                    print(line)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        ```
        
        ### Normal
        A normal HTTP request and response lifecycle. Server will send the complete text (it will take more time to response)
        
        ```swift
        Task {
            do {
                let response = try await api.sendMessage(text: "What is ChatGPT?")
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
        ```
        """
}

let ChatMarkText1 = #"""
  You can call out code or a command within a sentence with single backticks.
  The text within the backticks will not be formatted.

  ```
  Use `git status` to list all new or modified files that haven't yet been committed.
  ```

  Use `git status` to list all new or modified files that haven't yet been committed.

  To format code or text into its own distinct block, either use triple backticks
  (` ``` `) or indent each line by 4 spaces.

  ~~~
  After creating a group, any modifier you apply to the group affects
  all of that group’s members.

  ```swift
  Group {
      Text("SwiftUI")
      Text("Combine")
      Text("Swift System")
  }
  .font(.headline)
  ```
  ~~~

  After creating a group, any modifier you apply to the group affects
  all of that group’s members.

  ```swift
  Group {
      Text("SwiftUI")
      Text("Combine")
      Text("Swift System")
  }
  .font(.headline)
  ```
  """#
