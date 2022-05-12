//
//  DisclosureGroupPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct DisclosureGroupPage: View {
    @State private var revealDetails = false
    
    var body: some View {
        VStack {
            
            DisclosureGroup("Show Terms", isExpanded: $revealDetails) {
                Text("Long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here.")
                    .font(.title3)
                    .foregroundColor(Color.red)
                    .background(Color.green)
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("DisclosureGroup")
    }
}

struct DisclosureGroupPage_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupPage()
    }
}
