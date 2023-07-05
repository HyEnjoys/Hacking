//
//  PickerSamplePage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/7/5.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct PickerSamplePage: View {
    
    var elems = ["Short", "Tall", "Grande", "Venti"]
    
    @State var selection: Int = 0
    
    var body: some View {
        ScrollView {
            Picker(selection: $selection, label: Text("Label")) {
                ForEach(0..<elems.endIndex) { Text(self.elems[$0]).tag($0) }
            }
            .frame(width: 200)
            
            Picker(selection: $selection, label: Text(elems[selection])) {
                ForEach(0..<elems.count) { Text(self.elems[$0]).tag($0) }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 200)
            .padding()
            
            Picker(selection: $selection, label: Text(elems[selection])) {
                ForEach(0..<elems.count) { Text(self.elems[$0]).tag($0) }
            }
            .pickerStyle(SegmentedPickerStyle()) 
            .frame(width: 200)
            .padding()
            
        }.navigationBarTitle("Picker")
    }
}

struct PickerSamplePage_Previews: PreviewProvider {
    static var previews: some View {
        PickerSamplePage()
    }
}
