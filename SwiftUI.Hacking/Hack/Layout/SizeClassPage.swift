//
//  SizeClassPage.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/9.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI

struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct SizeClassPage: View {
    var body: some View {
        AdaptiveStack {
            Text("Horizontal when there's lots of space")
            Text("* but *")
            Text("Vertical when space is restricted")
        }
        .navigationBarTitle("Auto Size Class")
    }
}

struct SizeClassPage_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassPage()
    }
}
