//
//  AnimationPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct AnimationPage: View {
    
    @State var color: Color = .clear
    @State var color1: Color = .red
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
                .animation(Animation.easeInOut)
                .onAppear {
                    delay(1) {
                        color = .green
                    }
                }
            
            Button("Animation") {
                self.color = (self.color == .red) ? Color.blue : Color.red
            }
            .font(.largeTitle)
            .padding()
            
            Rectangle().frame(width: 100, height: 100).foregroundColor(color1)
            
            Button("withAnimation") {
                withAnimation {
                    self.color1 = (self.color1 == .red) ? Color.blue : Color.red
                }
            }
            .font(.largeTitle)
            .padding()
        }
        .navigationBarTitle("withAnimation")
    }
}

#if DEBUG
struct AnimationPage_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPage()
    }
}
#endif


/// 延迟
public func delay(_ delay: Double, _ closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}
extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}
