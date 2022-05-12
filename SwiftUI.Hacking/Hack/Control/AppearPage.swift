//
//  AppearPage.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct AppearPage: View {
    var body: some View {
        VStack {
            Text("Hello Appear")
        }
        .navigationBarTitle("Appear")
        .onAppear {
            print("onAppear")
        }
        .onDisappear {
            print("onDisappear")
        }
    }
}

#if DEBUG
struct AppearPage_Previews: PreviewProvider {
    static var previews: some View {
        AppearPage()
    }
}
#endif
