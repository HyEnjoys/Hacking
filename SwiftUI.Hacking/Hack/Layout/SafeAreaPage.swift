//
//  SafeAreaPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/16.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct SafeAreaPage: View {
    
    var body: some View {
        // Text("Hello World!")
//        Color.red
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//            .edgesIgnoringSafeArea([.bottom, .top])
        
//        List(0..<100) { i in
//                Text("Row \(i)")
//            }
//            .navigationTitle("Select a row")
//            .edgesIgnoringSafeArea([.bottom])
//                Text("Outside Safe Area")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
        
        if #available(iOS 15.0, *) {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Select a row")
            .safeAreaInset(edge: .bottom, alignment: .trailing) {
                Button {
                    print("Show help")
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .symbolRenderingMode(.multicolor)
                        .padding(.trailing)
                }
                .accessibilityLabel("Show help")
            }
        } else {
            // Fallback on earlier versions
        }
            
    }
}

#if DEBUG
struct SafeAreaPage_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaPage()
    }
}
#endif
