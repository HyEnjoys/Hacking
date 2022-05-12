//
//  PathPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct PathPage: View {
    var body: some View {
        Path { (path) in
            path.move(to: CGPoint(x: 20, y: 0))
            path.addLine(to: CGPoint(x: 20, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addArc(center: CGPoint(x: 150, y: 300), radius: 100, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
        }
    }
}

#if DEBUG
struct PathPage_Previews: PreviewProvider {
    static var previews: some View {
        PathPage()
    }
}
#endif
