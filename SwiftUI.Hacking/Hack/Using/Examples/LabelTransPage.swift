//
//  LabelTransPage.swift
//  SwiftUI.Hacking
//
//  Created by ghost on 2023/6/14.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI
import Combine

struct LabelTransPage: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var amount: Int = 100
    @State private var flipped = false
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 100)
                .background(Color.pink)
                .cornerRadius(10)
            
            Text("Hello, World!")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: -1, y: 0, z: 0))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.flipped.toggle()
                    }
                }
        }
        .onReceive(timer, perform: { _ in
            // self.flipped.toggle()
            guard amount > 0 else {
                self.timer.upstream.connect().cancel()
                return
            }
            withTransaction(Transaction.init(animation: Animation.linear)) {
                amount -= 1
            }
        })
        .navigationTitle("Label翻转")
    }
}

struct LabelTransPage1: View {
    
    @State var last = 100
    @State var next = 100
    @State var nextHidden = true
    @State var axis_x: CGFloat = -1
    @State var degree_x: Double = 0
    @State var degree_y: Double = 0
    @State var degree_z: Double = 0
    
    let space: Double = 2/60.0
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    @State private var amount: Int = 0
    @State private var text: String = "99"
    
    var body: some View {
        VStack {
            ZStack {
                Text("99")
                    .font(.largeTitle)
                    .frame(width: 140, height: 80)
                Text("98")
                    .font(.largeTitle)
                    .frame(width: 140, height: 80)
                    .opacity(nextHidden ? 0.0 : 1.0)
                Text(text)
                    .font(.largeTitle)
                    .frame(width: 140, height: 80)
                    .rotation3DEffect(.degrees(180 * degree_x), axis: (x: axis_x, y: 0.0, z: 0.0))
                    .rotation3DEffect(.degrees(180 * degree_z), axis: (x: 0.0, y: 0.0, z: 1.0))
                    .rotation3DEffect(.degrees(180 * degree_y), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .animation(.linear)
            }
        }
        .onReceive(timer, perform: { _ in
            guard amount < 30 else {
                self.timer.upstream.connect().cancel()
                return
            }
            amount += 1
            degree_x += space
            print(degree_x)
            if degree_x >= 0.5 {
                nextHidden = false
                text = "98"
                axis_x = 1
                degree_y = 1
                degree_z = 1
            }
        })
        .ignoresSafeArea()
    }
}

struct LabelTransPage2: View {
    
    @State var last = 99
    @State var next = 98
    @State var opacity_next: CGFloat = 0.0
    @State var degree_x: Double = 0
    @State var degree_y: Double = 0
    @State var degree_z: Double = 0
    
    let space: Double = 2/60.0
    let timer = Timer.publish(every: 1/60, on: .main, in: .common).autoconnect()
    
    @State private var amount: Int = 0
    @State private var text: String = "99"
    
    var body: some View {
        VStack {
            ZStack {
                Text("\(last)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 140, height: 80)
                Text("\(next)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 140, height: 80)
                    .opacity(opacity_next)
                Text(text)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(width: 140, height: 80)
                    .rotation3DEffect(.degrees(180 * degree_x), axis: (x: -1, y: 0.0, z: 0.0))
                    .animation(.easeIn)
                    .rotation3DEffect(.degrees(180 * degree_z), axis: (x: 0.0, y: 0.0, z: 1.0)) // yz轴的翻转必能有动画, 否二会有视觉干扰
                    .rotation3DEffect(.degrees(180 * degree_y), axis: (x: 0.0, y: 1.0, z: 0.0))
            }
        }
        .onReceive(timer, perform: { _ in
            guard amount < 30 else {
                opacity_next = 0
                last = next
                self.timer.upstream.connect().cancel()
                return
            }
            amount += 1
            degree_x += space
            print(degree_x)
            if degree_x >= 0.1 {
                opacity_next = 1
            }
            if degree_x >= 0.5 {
                text = "\(next)"
                degree_y = 1
                degree_z = 1
            }
        })
        .onAppear {
            text = "\(last)"
        }
        .ignoresSafeArea()
    }
}

struct LabelTransPage3: View {
    
    //MARK: 私有属性 -------------------
    // 当前显示的文本
    @State private var currentText: String = "13"
    // 下一个显示的文本
    @State private var nextText: String = "12"
    //
    @State private var animateText: String = "13"
    // 动画进度
    @State private var progress: Double = 0.0
    // 是否显示下一个文本
    @State private var showNextText: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var count: Int = 100
        
    var body: some View {
        VStack {
            Text(animateText)
                .font(.largeTitle)
                .foregroundColor(.black)
                .frame(width: 80, height: 60)
                .transition(.move(edge: .top))
        }
        .onReceive(timer, perform: { _ in
            count += 1
            withTransaction(Transaction.init(animation: .linear)) {
                animateText = "\(count)"
            }
        })
    }
    
}

struct LabelTransPage_Previews: PreviewProvider {
    static var previews: some View {
        // LabelTransPage()
        // LabelTransPage1()
        // LabelTransPage2()
        LabelTransPage3()
    }
}
