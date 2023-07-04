//
//  SiriWavePage.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/7/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct SiriWavePage: View {
    
    @State var power = 0.0
    @State var colors: [Color] = [
        Color(red: (182 / 255), green: (41 / 255), blue: (230 / 255)),
        Color(red: (39 / 255), green: (84 / 255), blue: (232 / 255)),
        Color(red: (39 / 255), green: (203 / 255), blue: (232 / 255))
    ]
    @State var randomizeTimer: Timer?
        
    var body: some View {
        VStack {
            // siri
            SiriWaveView(power: $power, lineColor: .constant(.black))
//                .colors([
//                    Color(red: (39 / 255), green: (84 / 255), blue: (232 / 255)),
//                    Color(red: (39 / 255), green: (203 / 255), blue: (232 / 255))
//                ])
                .frame(height: 100, alignment: .leading)
            
            // operate
            Button {
                if randomizeTimer == nil {
                    randomizeTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { _ in
                        let randomPower = Double.random(in: 0...1.0)
                        self.power = self.power == 0.0 ? randomPower : 0.0
                    })
                } else {
                    randomizeTimer?.invalidate()
                    randomizeTimer = nil
                }
            } label: {
                Text(randomizeTimer == nil ? "Randomize!" : "Stop")
            }
            .padding()
            
            Button {
                self.colors = [
                    Color(red: (39 / 255), green: (84 / 255), blue: (232 / 255)),
                    Color(red: (39 / 255), green: (203 / 255), blue: (232 / 255))
                ]
            } label: {
                Text("改变颜色")
            }
            .padding()

        }
    }
}

struct SiriWavePage_Previews: PreviewProvider {
    static var previews: some View {
        SiriWavePage()
    }
}
