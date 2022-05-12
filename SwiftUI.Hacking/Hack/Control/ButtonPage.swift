//
//  ButtonPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct ButtonPage: View {
    @State var showingDetail = false
    
    var body: some View {
        
        VStack {
            
            Text("Hacking with Swift")
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
            
            
            Button("Button") {
                print("Tapped")
            }
            .foregroundColor(.blue)
            .accentColor(.yellow) // 主题颜色
            .padding()
            
            Button(action: {
                self.showingDetail.toggle()
            }) {
                Text("Show Detail")
            }.sheet(isPresented: $showingDetail) {
                Text("IsPresent View")
            }
        }
        .navigationBarTitle("Button")
    }
}

#if DEBUG
struct ButtonPage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPage()
    }
}
#endif
