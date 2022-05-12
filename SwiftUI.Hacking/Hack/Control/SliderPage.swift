//
//  SliderPage.swift
//  SwiftUI.lists
//
//  Created by Enjoy on 2019/7/26.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct SliderPage: View {
    @State var progress: Float = 0.5
    @State var angleProgress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Text("Slider Value: \(self.progress)")
            
            Slider(value: $progress).padding()
            
            Slider(value: $progress, in: 0...100)
                    
            HStack {
                Image(systemName: "sun.min")
                Slider(value: $progress)
                Image(systemName: "sun.max.fill")
            }.padding()
            
            ProgressPage(progress: $angleProgress)
                .frame(width: 300, height: 15)
                .padding(.vertical, 25)
            Button(action: {
                self.angleProgress = CGFloat.random(in: 0...100)
                print("angleProgress: \(self.angleProgress)")
            }) {
                Text("Random")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.yellow, .blue]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                    .cornerRadius(40)
                    .padding(.horizontal, 50)
            }
        }
        .navigationBarTitle(Text("Slider"))
    }
}

#if DEBUG
struct SliderPage_Previews: PreviewProvider {
    static var previews: some View {
        SliderPage()
    }
}
#endif
