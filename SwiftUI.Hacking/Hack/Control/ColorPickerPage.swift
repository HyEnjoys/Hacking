//
//  ColorPickerPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/10.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct ColorPickerPage: View {
    
    @State private var bgColor = Color.white
    
    var body: some View {
        VStack(alignment: .center) {
            ColorPicker("Set the background color", selection: $bgColor)
                .padding()
            
            /// ColorPicker支持不透明度, 但是可以使用supportsOpacity禁用
            ColorPicker("Set the background color", selection: $bgColor, supportsOpacity: false)
                .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
        .navigationBarTitle("Color Picker")
    }
}

struct ColorPickerPage_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerPage()
    }
}
