//
//  FormWave.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/7/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct FormWave: View {
    var body: some View {
        VStack {
            AnimatedWaveformView()
                .scaledToFit()

            // with a custom color
            AnimatedWaveformView(color: .mint)
                .scaledToFit()

            // render the AnimatedWaveform with a slightly lighter ring, using the renderingMode hierarchical
            AnimatedWaveformView(color: .purple, renderingMode: .hierarchical)
                .scaledToFit()

            // render the AnimatedWaveform with custom colors, using the renderingMode palette
            AnimatedWaveformView(color: .green, renderingMode: .palette, secondaryColor: .yellow)
                .scaledToFit()

            // render the AnimatedWaveform without animation
            AnimatedWaveformView(animated: false)
                .scaledToFit()
        }
    }
}

struct FormWave_Previews: PreviewProvider {
    static var previews: some View {
        FormWave()
    }
}
