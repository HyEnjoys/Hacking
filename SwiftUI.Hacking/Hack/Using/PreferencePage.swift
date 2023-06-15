//
//  PreferencePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/9/9.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct MyTextPreferenceData: Equatable {
    let viewIdx: Int
    let rect: CGRect
}

struct MyTextPreferenceKey: PreferenceKey {
    typealias Value = [MyTextPreferenceData]
    
    static var defaultValue: [MyTextPreferenceData] = []
    
    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

struct MonthView: View {
    @Binding var activeMonth: Int
    let label: String
    let idx: Int
    
    var body: some View {
        Text(label)
            .padding(10)
            .background(MyPreferenceViewSetter(idx: idx))
            .onTapGesture {
                self.activeMonth = self.idx
            }
    }
}

struct MyPreferenceViewSetter: View {
    let idx: Int
    
    var body: some View {
        GeometryReader { geometry in
            Ellipse()
                .fill(Color.orange.opacity(0.25))
            Rectangle()
                .fill(Color.clear)
                .preference(key: MyTextPreferenceKey.self,
                            value: [MyTextPreferenceData(viewIdx: self.idx, rect: geometry.frame(in: .named("myZstack")))])
        }
    }
}

struct PreferencePage: View {
    
    @State private var activeIdx: Int = 0
    @State private var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 12)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // 边框视图
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 3.0)
                .foregroundColor(Color.green)
                .frame(width: rects[activeIdx].size.width, height: rects[activeIdx].size.height)
                .offset(x: rects[activeIdx].minX, y: rects[activeIdx].minY)
                .animation(.easeInOut(duration: 0.5))
            
            VStack {
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "January", idx: 0)
                    MonthView(activeMonth: $activeIdx, label: "February", idx: 1)
                    MonthView(activeMonth: $activeIdx, label: "March", idx: 2)
                    MonthView(activeMonth: $activeIdx, label: "April", idx: 3)
                }
                
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "May", idx: 4)
                    MonthView(activeMonth: $activeIdx, label: "June", idx: 5)
                    MonthView(activeMonth: $activeIdx, label: "July", idx: 6)
                    MonthView(activeMonth: $activeIdx, label: "August", idx: 7)
                }
                
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "September", idx: 8)
                    MonthView(activeMonth: $activeIdx, label: "October", idx: 9)
                    MonthView(activeMonth: $activeIdx, label: "November", idx: 10)
                    MonthView(activeMonth: $activeIdx, label: "December", idx: 11)
                }
                
                Spacer()
            }
            .onPreferenceChange(MyTextPreferenceKey.self) { preferences in
                for p in preferences {
                    self.rects[p.viewIdx] = p.rect
                }
            }
        }
        .coordinateSpace(name: "myZstack")
    }
}

struct PreferencePage_Previews: PreviewProvider {
    static var previews: some View {
        PreferencePage()
    }
}
