//
//  AirplanePage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct Airplane: View {
    
    @Binding var moveCircle: Bool
    
    var body: some View {
        GeometryReader { proxy in
            let w = min(proxy.size.width - 50, proxy.size.height - 50)
            ZStack(alignment: .center) {
                Color.clear
                
                Circle()
                    .stroke()
                    .frame(width: w, height: w)
                    .foregroundColor(Color.yellow)
                
                Image(systemName: "airplane")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                    .offset(y: -w/2)
                    .rotationEffect(Angle(degrees: moveCircle ? 0 : -360))
                    /// autoreverses: 是否回复动画, 就是沿着轨迹重新复位
                    /// Animation.linear(duration: 5) 线性动画
                    .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                    .onAppear {
                        self.moveCircle.toggle()
                    }
            }
        }
    }
}

struct Process: View {
    
    @Binding var progress: CGFloat
    
    private var rotationAngle: Angle {
        return Angle(degrees: (360.0 * progress))
    }

    var body: some View {
        GeometryReader { proxy in
            let w = proxy.size.height - 124
            VStack {
                ZStack {
                    if #available(iOS 15.0, *) {
                        Circle()
                            .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9), lineWidth: 20.0)
                            .overlay() {
                                Text("\(progress, specifier: "%.1f")")
                                    .font(.system(size: 78, weight: .bold, design:.rounded))
                            }
                    } else {
                        Circle()
                            .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9),
                                    lineWidth: 20.0)
                            .background(
                                Text("\(progress, specifier: "%.1f")")
                                    .font(.system(size: 78, weight: .bold, design:.rounded))
                            )
                    }
                    
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color(hue: 0.0, saturation: 0.5, brightness: 0.9),
                                style: StrokeStyle(lineWidth: 20.0, lineCap: .round))
                        // 初始位置修改为顶端
                        .rotationEffect(Angle(degrees: -90))

                    Circle()
                        .fill(Color.white)
                        .shadow(radius: 3)
                        .frame(width: 21, height: 21)
                        .offset(y: -w / 2.0)
                        // 修改位置
                        .rotationEffect(rotationAngle)
                }
                .frame(width: w, height: w)
                
                Spacer()
                
                VStack {
                    Text("Progress: \(progress, specifier: "%.1f")")
                        .font(.subheadline)
                    Slider(value: $progress,
                           in: 0...1,
                           minimumValueLabel: Text("0.0"),
                           maximumValueLabel: Text("1.0")
                    ) {}
                }
                .frame(height: 80)
                .padding(.all, 24)
            }
        }
    }
}

struct AirplanePage: View {
    
    @State var progress: CGFloat = 0.33
            
    @State var moveCircle: Bool = false
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.04, brightness: 1.0)
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                ZStack {
                    Color(hue: 0.58, saturation: 0.04, brightness: 1.0)
                    
                    VStack {
                        Airplane(moveCircle: $moveCircle)
                            .frame(height: proxy.size.height / 2)
                        
                        Process(progress: $progress)
                            .frame(height: proxy.size.height / 2)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct AirplanePage_Previews: PreviewProvider {
    static var previews: some View {
        AirplanePage()
    }
}
#endif

/*
 struct CircularSliderView: View {
     @Binding var progress: Double

     @State private var rotationAngle = Angle(degrees: 0)
     private var minValue = 0.0
     private var maxValue = 1.0
     
     init(value progress: Binding<Double>, in bounds: ClosedRange<Int> = 0...1) {
         self._progress = progress
         
         self.minValue = Double(bounds.first ?? 0)
         self.maxValue = Double(bounds.last ?? 1)
         self.rotationAngle = Angle(degrees: progressFraction * 360.0)
     }
     
     private var progressFraction: Double {
         return ((progress - minValue) / (maxValue - minValue))
     }
     
     private func changeAngle(location: CGPoint) {
         // 为位置创建一个向量（在 iOS 上反转 y 坐标系统）
         let vector = CGVector(dx: location.x, dy: -location.y)
         
         // 计算向量的角度
         let angleRadians = atan2(vector.dx, vector.dy)
         
         // 将角度转换为 0 到 360 的范围（而不是负角度）
         let positiveAngle = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
         
         // 根据角度更新滑块进度值
         progress = ((positiveAngle / (2.0 * .pi)) * (maxValue - minValue)) + minValue
         rotationAngle = Angle(radians: positiveAngle)
     }
     
     var body: some View {
         GeometryReader { gr in
             let radius = (min(gr.size.width, gr.size.height) / 2.0) * 0.9
             let sliderWidth = radius * 0.1
             
             VStack(spacing:0) {
                 ZStack {
                     Circle()
                         .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9),
                                 style: StrokeStyle(lineWidth: sliderWidth))
                         .overlay() {
                             Text("\(progress, specifier: "%.1f")")
                                 .font(.system(size: radius * 0.7, weight: .bold, design:.rounded))
                         }
                     // 取消注释以显示刻度线
                     //Circle()
                     //    .stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.6),
                     //            style: StrokeStyle(lineWidth: sliderWidth * 0.75,
                     //                               dash: [2, (2 * .pi * radius)/24 - 2]))
                     //    .rotationEffect(Angle(degrees: -90))
                     Circle()
                         .trim(from: 0, to: progressFraction)
                         .stroke(Color(hue: 0.0, saturation: 0.5, brightness: 0.9),
                                 style: StrokeStyle(lineWidth: sliderWidth, lineCap: .round)
                         )
                         .rotationEffect(Angle(degrees: -90))
                     Circle()
                         .fill(Color.white)
                         .shadow(radius: (sliderWidth * 0.3))
                         .frame(width: sliderWidth, height: sliderWidth)
                         .offset(y: -radius)
                         .rotationEffect(rotationAngle)
                         .gesture(
                             DragGesture(minimumDistance: 0.0)
                                 .onChanged() { value in
                                     changeAngle(location: value.location)
                                 }
                         )
                 }
                 .frame(width: radius * 2.0, height: radius * 2.0, alignment: .center)
                 .padding(radius * 0.1)
             }
             
             .onAppear {
                 self.rotationAngle = Angle(degrees: progressFraction * 360.0)
             }
         }
     }
 }

 */
