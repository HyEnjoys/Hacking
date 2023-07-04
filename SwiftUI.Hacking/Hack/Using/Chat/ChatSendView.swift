//
//  ChatSendView.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/6/15.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct ChatSendView: View {
    
    @EnvironmentObject var viewModel : ChatViewModel
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var messageText = ""
    
    @State var inputHeight: CGFloat = 24
        
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ZStack {
                if #available(iOS 16.0, *) {
                    TextField("消息", text: $messageText, axis: .vertical)
                        .padding(10)
                        .background((colorScheme == .light) ? Color.white : Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke((colorScheme == .light) ? Color.black : Color.white, lineWidth: 1)
                        )
                        .cornerRadius(10)
                        .padding(10)
                } else {
                    ZStack(alignment: .topLeading) {
                        Text(messageText)
                            .lineLimit(4)
                            .background(GeometryReader { p in
                                Color.clear.preference(key: GeometryKey.self, value: p.size.height)
                            })
                            .onPreferenceChange(GeometryKey.self) {
                                self.inputHeight = max(24, ($0 ?? 0) + 4)
                            }
                            .padding(12)
                            .padding(10)

                        /*
                         TextEditor(text: $messageText)
                             .foregroundColor((colorScheme == .light) ? Color.black : Color.white)
                             .frame(height: inputHeight)
                             .padding(12)
                             .background((colorScheme == .light) ? Color.white : Color.black)
                             .cornerRadius(10)
                             .padding(10)
                             .shadow(color: (colorScheme == .light) ? Color.white : Color.black, radius: 1)
                         */
                        /// 这货只有黑白背景颜色, 是无法直接修改
                        /// 在iOS16.0中, 可以使用.scrollContentBackground(.hidden)
                        /// iOS16以下使用UITextView.appearance().backgroundColor = .clear
                        TextEditor(text: $messageText)
                            .frame(height: inputHeight)
                            .padding(10)
                            .background((colorScheme == .light) ? Color.gray : Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke((colorScheme == .light) ? Color.black : Color.white, lineWidth: 1)
                            )
                            .padding(10)
                            .onAppear {
                                UITextView.appearance().backgroundColor = .clear
                            }
                            .onDisappear {
                                UITextView.appearance().backgroundColor = nil
                            }
                    }
                }

                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "waveform")
                            .font(.system(size: 24))
                    }
                    .disabled(!messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    .padding(.trailing, 14)
                }
            }
            Button(action: {
                viewModel.sendMessage(sender: "Me", content: .text(messageText))
                messageText = ""
            }, label: {
                Image(systemName: "paperplane.circle.fill")
                    .rotationEffect(.degrees(45))
                    .font(.system(size: 30))
            })
            .disabled(messageText.isEmpty)
            .padding(.trailing, 10)
        }
    }
}

struct ChatSendView1: View {
    
    @EnvironmentObject var viewModel : ChatViewModel
    
    @State var messageText = ""
    
    var body: some View {
        HStack(alignment: .center) {
            TextField("Message...", text: $messageText)
                .padding()
                .foregroundColor(.white)
                .lineLimit(3)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            Button {
                viewModel.sendMessage(sender: "Me", content: .text(messageText))
                messageText = ""
            } label: {
                Image(systemName: messageText.isEmpty ? "circle" : "paperplane.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(messageText.isEmpty ? .white.opacity(0.75) : .white)
                    .frame(width: 20, height: 20)
                    .padding()
            }
        }
        .onDisappear {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
        .background(Color.gray)
        .cornerRadius(10)
        .padding([.leading, .trailing, .bottom], 10)
        .shadow(color: .black, radius: 0.5)
    }
}

struct ChatSendView_Previews: PreviewProvider {
    static var previews: some View {
        ChatSendView()
    }
}
