//
//  BindingValueAnimatePage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct BindingValueAnimatePage: View {
    
    @State private var showingWelcome0 = false
    @State private var showingWelcome1 = false
    @State private var showingWelcome2 = false
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Toggle("Animation 0", isOn: $showingWelcome0)
                        .font(.title)
                        .padding()
                    
                    if showingWelcome0 {
                        Text("Hello World 0")
                            .font(.title)
                            .padding()
                    }
                }
                
                VStack {
                    Toggle("Animation 1", isOn: $showingWelcome1.animation())
                        .font(.title)
                        .padding()
                    
                    if showingWelcome1 {
                        Text("Hello World 1")
                            .font(.title)
                            .padding()
                    }
                }
                
                VStack {
                    Toggle("Animation 2", isOn: $showingWelcome2.animation(.spring()))
                        .font(.title)
                        .padding()
                    
                    if showingWelcome2 {
                        Text("Hello World 2")
                            .font(.title)
                            .padding()
                    }
                }
            }
            .padding()
        }
        .navigationBarTitle("Bind Value Animate")
    }
}

struct BindingValueAnimatePage_Previews: PreviewProvider {
    static var previews: some View {
        BindingValueAnimatePage()
    }
}
