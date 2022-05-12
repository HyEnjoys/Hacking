//
//  ProgressViewPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct ProgressViewPage: View {
    
    @State private var downloadAmount = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            
            ProgressView("Downloading…")
                .padding()
            
            ProgressView("Downloading…", value: downloadAmount, total: 100)
        }
        .onReceive(timer) { _ in
            if downloadAmount < 100 {
                downloadAmount += 2
            }
        }
        .navigationBarTitle("ProgressView")
    }
}

struct ProgressViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewPage()
    }
}
