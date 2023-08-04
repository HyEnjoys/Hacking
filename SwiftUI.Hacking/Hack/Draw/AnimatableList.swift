//
//  AnimatableList.swift
//  SwiftUI.Hacking
//
//  Created by 陈卓 on 2023/8/4.
//  Copyright © 2023 Yuan. All rights reserved.
//

import SwiftUI

struct AnimatableList: View {
    var body: some View {
        List {
            NavigationLink(destination: AnimatablePage()) {
                PageRow(image: "figure.badminton", name: "Basic")
            }
            NavigationLink(destination: AnimatablePairPage()) {
                PageRow(image: "figure.baseball", name: "Pair")
            }
            NavigationLink(destination: AnimatablePairPage()) {
                PageRow(image: "figure.baseball", name: "Pair")
            }

        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Animatable")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimatableList_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableList()
    }
}
