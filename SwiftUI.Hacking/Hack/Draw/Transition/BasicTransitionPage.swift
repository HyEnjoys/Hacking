//
//  BasicTransitionPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct BasicTransitionPage: View {
    
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            .font(.title)
            .padding()
            
            if showDetails {
                // Moves in from the bottom
                Text("Details go here.")
                    .padding()
                    .font(.title)
                    .transition(.move(edge: .bottom))
                
                // Moves in from leading out, out to trailing edge.
                Text("Details go here.")
                    .font(.title)
                    .padding()
                    .transition(.slide)
                
                // Starts small and grows to full size.
                Text("Details go here.")
                    .font(.title)
                    .padding()
                    .transition(.scale)
            }
        }
        .navigationBarTitle("Basic Transition")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BasicTransitionPage_Previews: PreviewProvider {
    static var previews: some View {
        BasicTransitionPage()
    }
}
