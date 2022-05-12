//
//  AnimatableCardsPage.swift
//  SwiftUI.lists
//
//  Created by Enjoy on 2019/8/9.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct AnimatableCardsPage: View {
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    @GestureState var dragState = DragState.inactive
    
    var body: some View {
        
        let dragGester = DragGesture()
            .updating($dragState) { (value, state, transaction) in
                state = .dragging(translation: value.translation)
        }
        return ZStack {
            
            Card(title: "Third card", color: Color.purple.opacity(0.7))
                .rotation3DEffect(Angle(degrees: dragState.isActive ? 0 : 60), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .padding(dragState.isActive ?  32 : 64)
                .padding(.bottom, dragState.isActive ? 32 : 64)
                .animation(.spring())
            Card(title: "Second card", color: Color.blue.opacity(0.7))
                .rotation3DEffect(Angle(degrees: dragState.isActive ? 0 : 30), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .padding(dragState.isActive ?  16 : 32)
                .padding(.bottom, dragState.isActive ? 0 : 32)
                .animation(.spring())
            Card(title: "Main card", color: Color.green.opacity(0.7))
                .offset(
                    x: dragState.translation.width,
                    y: dragState.translation.height
                )
                .rotationEffect(Angle(degrees: Double(dragState.translation.width / 10)))
                .shadow(radius: dragState.isActive ? 8 : 0)
                .animation(.spring())
                .gesture(dragGester)
        }
    }
}

#if DEBUG
struct AnimatableCardsPage_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableCardsPage()
    }
}
#endif

struct Card: View {
    
    var title: String
    var color: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(height: 230)
                .cornerRadius(10)
                .padding(20)
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
            }
        }
    }
}
