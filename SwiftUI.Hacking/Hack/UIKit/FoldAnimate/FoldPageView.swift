//
//  FoldPageView.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/6/14.
//  Copyright © 2023 Yuan. All rights reserved.
//

import UIKit
import SwiftUI

struct FoldPageView: View {
    
    @State var count: Int = 100
    @State var foldText: (String, String) = ("99", "98")
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            FoldView(textFont: UIFont.boldSystemFont(ofSize: 28), textColor: .red, backgroundColor: UIColor.lightGray, tuple: $foldText)
                .frame(width: 120, height: 60)
        }
        .onReceive(timer) { _ in
            guard count >= 1 else {
                timer.upstream.connect().cancel()
                return
            }
            count -= 1
            foldText = ("\(count + 1)", "\(count)")
        }
    }
}

struct FoldPageView_Previews: PreviewProvider {
    static var previews: some View {
        FoldPageView()
    }
}

struct FoldView: UIViewRepresentable {
    
    let textFont: UIFont
    let textColor: UIColor
    let backgroundColor: UIColor
    
    @Binding var tuple: (String, String)
    
    func updateUIView(_ uiView: FoldAnimationView, context: Context) {
        uiView.fold(current: tuple.0, next: tuple.1)
    }
    
    func makeUIView(context: Context) -> FoldAnimationView {
        let v = FoldAnimationView()
        v.font = textFont
        v.textColor = textColor
        v.backColor = backgroundColor
        return v
    }
}

