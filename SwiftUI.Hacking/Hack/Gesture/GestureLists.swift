//
//  GestureLists.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct GestureLists: View {
        
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Gesture")) {
                    NavigationLink(destination: TapGesturePage() ) { PageRow(image: "arrow.right.circle", name: "Tap") }
                    NavigationLink(destination: GestureMaskPage() ) { PageRow(image: "arrow.up.circle", name: "Tap Mask") }
                    NavigationLink(destination: LongPressGesturePage() ) { PageRow(image: "arrow.left.circle", name: "LongPress") }
                    NavigationLink(destination: DragGesturePage() ) { PageRow(image: "arrow.down.circle", name: "Drag") }
                    NavigationLink(destination: MagnificationGesturePage() ) { PageRow(image: "arrow.right.circle", name: "Magnification") }
                    NavigationLink(destination: RotationGesturePage() ) { PageRow(image: "arrow.up.circle", name: "Rotation") }
                    NavigationLink(destination: SimultaneousGesturePage() ) { PageRow(image: "arrow.left.circle", name: "Simultaneous") }
                    NavigationLink(destination: ExclusiveGesturePage() ) { PageRow(image: "arrow.down.circle", name: "ExclusiveGesture") }
                }
            }
            .onDisappear(perform: {
                
            })
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Gesture")
        }.edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct GestureLists_Previews: PreviewProvider {
    static var previews: some View {
        GestureLists()
    }
}
#endif
