//
//  DismissPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/16.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct DismissPage: View {
    
    // 默认跳转属性
    @Environment(\.presentationMode) var presentationMode
    
    @State var isPresent: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                // value -> wrappedValue 测试版本, 属性一直在改变
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss").italic().bold().font(.largeTitle)
            }
            
            Button(action: {
                self.isPresent.toggle()
            }) {
                Text("NewPage").italic().bold().font(.largeTitle)
            }
        }
        .fullScreenCover(isPresented: self.$isPresent, content: {
            NewPageView()
        })
        .navigationBarTitle("Dismiss")
    }
}

struct NewPageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Show")
                .padding()
            
            AddView {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}


struct AddView: View {
    
    var swipeHandle: () -> ()
    
    var body: some View {
        VStack {
            Button("Dismiss") {
                self.swipeHandle()
            }
        }
    }
}

#if DEBUG
struct DismissPage_Previews: PreviewProvider {
    static var previews: some View {
        DismissPage()
    }
}
#endif
