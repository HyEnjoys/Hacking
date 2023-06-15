//
//  ContentView.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let imgs = ["sun.min", "moon.zzz", "cloud.rain", "wind.snow", "timelapse", "signature"]
   
    @State var index: Int = 0 // 默认选中索引
    
    @EnvironmentObject var tabState : TabBarState
    
    var body: some View {
        /// 针对跳转页面后, 隐藏Tablebar的操作链接 https://blog.csdn.net/qq_31871783/article/details/107807401
        TabView(selection: $index) {
            ControlLists()
                .tabItem {
                    VStack {
                        Image(systemName: "moon.zzz")
                        Text("Control")
                            .bold()
                            .italic()
                    }
                }
                .tag(0)
            
            LayoutLists().tabItem {
                VStack {
                    Image(systemName: "sun.min")
                    Text("Layout")
                        .bold()
                        .italic()
                }
            }.tag(1)
            
            GestureLists().tabItem {
                VStack {
                    Image(systemName: "cloud.rain")
                    Text("Gesture")
                        .bold()
                        .italic()
                }
            }.tag(2)

            DrawLists().tabItem {
                VStack {
                    Image(systemName: "wind.snow")
                    Text("Draw")
                        .bold()
                        .italic()
                }
            }.tag(3)
            
            UsingLists()
                .tabItem {
                    VStack {
                        Image(systemName: "timelapse")
                        Text("Using")
                            .bold()
                            .italic()
                    }
                }
                .tag(4)
        }
        
    }
}

fileprivate struct TabItemPage: View {
    var index: Int
    var body: some View {
        ZStack {
            // Rectangle().foregroundColor(Color.orange)
            VStack {
                Text("\(index)")
                    .foregroundColor(.pink)
                    .font(.system(size: 100, design: .rounded))
                    .bold()
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 200,height: 200)
            }
        }
    }
    
}

// TabBarState.swift
class TabBarState: ObservableObject {
    @Published var hidden : Bool = false
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
