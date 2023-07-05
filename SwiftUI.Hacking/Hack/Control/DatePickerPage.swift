//
//  DatePickerPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/7/5.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct DatePickerPage: View {
    
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
            }
            .padding()
            
            // 设置最小日期: Date()...
            // 设置最大日期: ...Date()
            DatePicker("Minimum Date",
                       selection: $selection,
                       in: Date()...,
                       displayedComponents: [.date])
                .padding()
        }
        .navigationTitle("Date Picker")
    }
}

struct DatePickerPage_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerPage()
    }
}
