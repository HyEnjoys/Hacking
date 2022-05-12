//
//  PickerView.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    var body: some View {
        Text("Hello World!")
    }
}

struct DatePickerSample: View {
    
    @State var selection: Date = Date()
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        return min...max
    }
    
    var body: some View {
        ScrollView {
            
            Text(selection.description).bold().italic().padding()
            
            DatePicker("Date Picker", selection: $selection)
                .frame(width: 200)
                .labelsHidden() /// 可以把文字隐藏掉, 整体数据中显示UI
                .padding()
            
            // 设置日期范围
            DatePicker(selection: $selection, in: dateClosedRange) {
                Text("dateClosedRange")
            }.padding()
            
            // 设置最小日期: Date()...
            // 设置最大日期: ...Date()
            DatePicker("Minimum Date",
                       selection: $selection,
                       in: Date()...,
                       displayedComponents: [.date])
                .padding()
        }
    }
}


struct PickerSample: View {
    var elems = ["Short", "Tall", "Grande", "Venti"]
    @State var selection: Int = 0
    
    var body: some View {
        ScrollView {
            Picker(selection: $selection, label: Text("Label")) {
                ForEach(0..<elems.endIndex) {
                    Text(self.elems[$0]).tag($0)
                }
            }.frame(width: 200)
            
            Picker(selection: $selection, label: Text(elems[selection])) {
                ForEach(0..<elems.endIndex) {
                    Text(self.elems[$0]).tag($0)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 200)
            .padding()
            
            Picker(selection: $selection, label: Text(elems[selection])) {
                ForEach(0..<elems.endIndex) {
                    Text(self.elems[$0]).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 200)
            .padding()
            
        }.navigationBarTitle("Picker")
    }
}

#if DEBUG
struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
#endif
