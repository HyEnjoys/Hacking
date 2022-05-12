//
//  MenuPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct MenuPage: View {
    
    let menuItems = ContextMenu {
        ForEach([MessageMenuAction.copy, MessageMenuAction.delete, MessageMenuAction.relay]) { edit in
            Button(action: {
                print("Send")
            }) {
                HStack {
                    Text(edit.title).font(.title)
                    Image(systemName: edit.systemImage)
                }
            }
        }
    }
    
    private var shouldShowMenu = true
    
    var body: some View {    
        VStack {
            Image("icon.popular")
                .font(.largeTitle)
                .contextMenu {  /// 这玩意会修改原始的偏移, 因此如果做便宜的话, 需要针对Menu后的视图进行偏移处理
                    Button(action: {
                        print("Send")
                    }) {
                        HStack {
                            Text("Send").font(.title)
                            Image(systemName: "paperplane")
                        }
                    }
                    Button(action: {
                        print("Mark")
                    }) {
                        HStack {
                            Text("Mark").font(.title)
                            Image(systemName: "star.fill")
                        }
                    }
                }
            
            Image(systemName: "doc.on.doc")
                .contextMenu(shouldShowMenu ? menuItems : nil)
        }
        .navigationBarTitle("Menu")
    }
}

#if DEBUG
struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
    }
}
#endif

enum MessageMenuAction: Int, Identifiable {
    
    case none = 0
    case copy
    case relay
    case revoke
    case delete
    case multi
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .copy:
            return "复制"
        case .relay:
            return "转发"
        case .revoke:
            return "撤销"
        case .delete:
            return "删除"
        case .multi:
            return "多选"
        default:
            return ""
        }
    }
    
    var systemImage: String {
        switch self {
        case .copy:
            return "doc.on.doc"
        case .relay:
            return "arrowshape.turn.up.right"
        case .revoke:
            return "arrow.uturn.backward"
        case .delete:
            return "trash"
        case .multi:
            return "list.star"
        default:
            return ""
        }
    }
}
