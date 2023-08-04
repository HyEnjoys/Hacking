//
//  DrawLists.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct DrawLists: View {
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Animation")) {
                    NavigationLink(destination: AnimateList()) {
                        PageRow(image: "figure.walk", name: "Animation Lists")
                    }
                    NavigationLink(destination: TransitionList()) {
                        PageRow(image: "figure.run", name: "Transition Lists")
                    }
                }
                
                Section(header: Text("Shapes")) {
                    NavigationLink(destination: DashlinePage()) {
                        PageRow(image: "umbrella", name: "Dash Line")
                    }
                    NavigationLink(destination: PathPage()) {
                        PageRow(image: "beach.umbrella", name: "Path")
                    }
                    NavigationLink.init(destination: PathPage2()) {
                        PageRow(image: "beach.umbrella.fill", name: "Path2")
                    }
                    NavigationLink(destination: RectAnglePage()) {
                        PageRow(image: "clock", name: "RectAngle")
                    }
                    NavigationLink(destination: EdgePage()) {
                        PageRow(image: "alarm", name: "Edge")
                    }
                    NavigationLink(destination: RoundedRectanglePage()) {
                        PageRow(image: "stopwatch", name: "RoundedRectangle")
                    }
                    NavigationLink(destination: TrimRectangle()) {
                        PageRow(image: "timer", name: "TrimRectangle")
                    }
                    NavigationLink(destination: CirclePage()) {
                        PageRow(image: "timer", name: "Circle")
                    }
                    NavigationLink(destination: EllipsePage()) {
                        PageRow(image: "timer", name: "Ellipse")
                    }
                    NavigationLink(destination: CapsulePage()) {
                        PageRow(image: "flame", name: "Capsule")
                    }
                }
                
                Section(header: Text("Transform")) {
                    NavigationLink(destination: CanvaPage()) {
                        PageRow(image: "umbrella.fill", name: "Canva")
                    }
                    NavigationLink(destination: ScaledShapePage()) {
                        PageRow(image: "gamecontroller", name: "ScaledShape")
                    }
                    NavigationLink(destination: RelativeShapePage()) {
                        PageRow(image: "gamecontroller", name: "ContainerRelativeShape")
                    }
                    NavigationLink(destination: RotatedShapePage()) {
                        PageRow(image: "rectangle.compress.vertical", name: "RotatedShape")
                    }
                    NavigationLink(destination: OffsetShapePage()) {
                        PageRow(image: "rectangle.expand.vertical", name: "OffsetShape")
                    }
                    NavigationLink(destination: TransformedShapePage()) {
                        PageRow(image: "chart.bar", name: "TransformedShape")
                    }
                }
                
                Section(header: Text("Paint Style Gradient")) {
                    NavigationLink(destination: ColorPage()) {
                        PageRow(image: "burst", name: "Color")
                    }
                    NavigationLink(destination: ImagePaintPage()) {
                        PageRow(image: "waveform.path.ecg", name: "ImagePaint")
                    }
                    NavigationLink(destination: LinearGradientPage()) {
                        PageRow(image: "waveform", name: "LinearGradient")
                    }
                    NavigationLink(destination: AngularGradientPage()) {
                        PageRow(image: "staroflife", name: "AngularGradient")
                    }
                    NavigationLink(destination: RadialGradientPage()) {
                        PageRow(image: "headphones", name: "RadialGradient")
                    }
                    NavigationLink(destination: GeometryReaderPage()) {
                        PageRow(image: "gift", name: "GeometryReader")
                    }
                }
                
                Section(header: Text("Border")) {
                    NavigationLink(destination: BorderPage()) {
                        PageRow(image: "gift", name: "Border")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Draw")
        }
    }
}

#if DEBUG
struct DrawLists_Previews: PreviewProvider {
    static var previews: some View {
        DrawLists()
    }
}
#endif
