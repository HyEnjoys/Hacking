//
//  EquatableViewPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct EquatableViewPage: View {
    
    @State var increment1: Int = 0
    @State var increment2: Int = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Button("left increment ++++") {
                    self.increment1 += 1
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.orange)
                
                Button("right increment") {
                    self.increment2 += 1
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.red)
            }
            .fixedSize(horizontal: false, vertical: true)
            
            EquatableView(content: ComparedView(increment1: increment1, increment2: increment2))
            
            HStack {
                Text("This is a short string.")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                
                Text("This is a very long string with lots and lots of text that.")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
            }
            .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Text("This is a short string.")
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                
                Text("This is a very long string with lots and lots of text that.")
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
            }
            .fixedSize(horizontal: false, vertical: true)
            
            VStack {
                Button("Log in") { }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .clipShape(Capsule())
                
                Button("Reset Password") { }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .clipShape(Capsule())
            }
            .fixedSize(horizontal: true, vertical: false)
        }
    }
}

struct ComparedView: View, Equatable {
    var increment1: Int
    var increment2: Int
    
    static func == (lhs: ComparedView, rhs: ComparedView) -> Bool {
        return lhs.increment1 == rhs.increment2
    }
    
    var body: some View {
        HStack {
            VStack {
                Text("Increment1")
                Text("\(increment1)")
            }
            VStack {
                Text("Increment2")
                Text("\(increment2)")
            }
        }
    }
}

#if DEBUG
struct EquatableViewPage_Previews: PreviewProvider {
    static var previews: some View {
        EquatableViewPage()
    }
}
#endif
