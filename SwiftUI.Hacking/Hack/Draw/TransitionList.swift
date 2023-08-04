//
//  TransitionList.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct TransitionList: View {
    var body: some View {
        List {
            NavigationLink(destination: BasicTransitionPage()) {
                PageRow(image: "figure.skiing.crosscountry", name: "Basic")
            }
            NavigationLink(destination: CombineTransitionPage()) {
                PageRow(image: "figure.cross.training", name: "Combine")
            }
            NavigationLink(destination: CustomTransitionPage()) {
                PageRow(image: "figure.curling", name: "Custom")
            }
            NavigationLink(destination: OverrideTransitionPage()) {
                PageRow(image: "figure.climbing", name: "Override Animations")
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Transition")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransitionList_Previews: PreviewProvider {
    static var previews: some View {
        TransitionList()
    }
}
