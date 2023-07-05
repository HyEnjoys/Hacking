//
//  CanvaPage.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/7/5.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct CanvaPage: View {
    
    var body: some View {
        VStack {
            /// iOS 15.0
            Canvas(
                opaque: true,
                colorMode: .linear,
                rendersAsynchronously: false
            ) { context, size in
                // 背景填充
                context.fill(Rectangle().path(in: .init(origin: .zero, size: size)), with: .color(.white))
                // 透明度
                context.opacity = 0.5
                
                let rect = CGRect(origin: .zero, size: size)
                
                var path = Circle().path(in: rect)
                context.fill(path, with: .color(.red))
                
                let newRect = rect.applying(.init(scaleX: 0.5, y: 0.5))
                path = Circle().path(in: newRect)
                context.fill(path, with: .color(.red))
                
                let text = Text(verbatim: "Hello draw").font(.largeTitle)
                var resolvedText = context.resolve(text)
                resolvedText.shading = .color(.red)
                context.draw(resolvedText, in: CGRect(x: 0, y: 200, width: size.width, height: 50))
                
                if let symbol = context.resolveSymbol(id: 1) {
                    context.draw(symbol, in: CGRect(x: 0, y: 300, width: size.width, height: 50))
                }
            } symbols: {
                Text(verbatim: "Symbols")
                    .foregroundColor(.red)
                    .tag(1)
            }
        }
        .ignoresSafeArea()
    }
}

@available(iOS 15.0, *)
struct CanvaPage1: View {
    
    var body: some View {
        TimelineView(.animation) { timelineContext in
            let value = secondsValue(for: timelineContext.date)
            
            Canvas(
                opaque: true,
                colorMode: .linear,
                rendersAsynchronously: false
            ) { context, size in
                let newSize = size.applying(.init(scaleX: value, y: 1))
                let rect = CGRect(origin: .zero, size: newSize)
                
                context.fill(Circle().path(in: rect), with: .color(.red))
            }
        }
        .ignoresSafeArea()
    }
        
    private func secondsValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        return Double(seconds) / 60
    }
    
}

struct CanvaPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 15.0, *) {
                CanvaPage()
                CanvaPage1()
            } else {
                EmptyView()
            }
        }
        
    }
}
