//
//  FormPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct FormPage: View {
    
    var strengths = ["Mild", "Medium", "Mature"]
    
    @State private var selectedStrength = 0
    
    var body: some View {
        Form {
            Section(header: Text("Header 1"), footer: Text("Footer 1")) {
                Text("cell 1")
                Text("cell 2")
                Text("cell 3")
            }
            Section(header: Text("Header 2"), footer: Text("Footer 2")) {
                Text("cell 1")
                Text("cell 2")
                Text("cell 3")
            }
            Section {
                Picker(selection: $selectedStrength, label: Text("Strength")) {
                    ForEach(0 ..< strengths.count) {
                        Text(self.strengths[$0])
                        
                    }
                }
                /// .pickerStyle(WheelPickerStyle())
            }
        }
        .navigationBarTitle("Form")
    }
}

#if DEBUG
struct FormPage_Previews: PreviewProvider {
    static var previews: some View {
        FormPage()
    }
}
#endif
