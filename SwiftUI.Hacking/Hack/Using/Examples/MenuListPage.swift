//
//  MenuListPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/9/23.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct MenuListPage: View {
    
    @State private var sideMenuActived: Bool = false
    
    var body: some View {
        ZStack {
            MenuBackgroundView()
            ZStack {
                RoundedRectangle(cornerRadius: sideMenuActived ? 32 : 0)
                    .foregroundColor(Color.green)
                    .shadow(radius: sideMenuActived ? 32 : 0) // 阴影
                VStack {
                    HStack {
                        Button(action: {
                            if !self.sideMenuActived {
                                self.sideMenuActived.toggle()
                            }
                        }) {
                            Image(systemName: "list.bullet.below.rectangle")
                                .accentColor(Color.white)
                                .frame(width: 50, height: 50, alignment: .center)
                                .scaleEffect(sideMenuActived ? 1.5 : 1.2)
                        }.padding(.top, 64).padding(.leading, 32)
                        Spacer()
                    }
                    Spacer()
                }
            }.onTapGesture {
                if self.sideMenuActived {
                    self.sideMenuActived.toggle()
                }
            }
            .offset(x: sideMenuActived ? 354 : 0) // 偏移
            .scaleEffect(sideMenuActived ? 0.7 : 1) // 压缩
            .animation(.spring(response: 0.5)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Text("a little work with 🚕")
                    .font(.system(size: 17, weight: .regular))
                    .italic()
                    .padding(16)
            }
        }
    }
}

struct MenuBackgroundView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "heart.circle")
        }
        .font(.largeTitle)
    }
}
