//
//  UsingLists.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import SwiftUI

struct UsingLists: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Animate")) {
                    NavigationLink(destination: AirplanePage()) {
                        PageRow(name: "Airplane")
                    }
                    NavigationLink(destination: AnimatableCardsPage()) {
                        PageRow(image: "creditcard", name: "AnimatableCards")
                    }
                    NavigationLink(destination: GestureImagePage()) {
                        PageRow(image: "tengesign.circle", name: "GestureImage")
                    }
                }
                Section(header: Text("Other")) {
                    NavigationLink(destination: DownloadImagePage()) {
                        PageRow(image:"square.and.arrow.down", name: "DownloadImage")
                    }
                    NavigationLink(destination: ActivityIndicatorView()) {
                        PageRow(image: "arrow.2.circlepath", name: "ActivityIndicator")
                    }
                    NavigationLink(destination: PageControlView()) {
                        PageRow(image: "arrow.2.circlepath", name: "PageControl")
                    }
                    NavigationLink(destination: PageViewController_Previews.previews) {
                        PageRow(image: "lasso", name: "PageViewController")
                    }
                    NavigationLink(destination: PreferencePage()) {
                        PageRow(image: "square.and.arrow.down", name: "Prederence")
                    }
                    NavigationLink(destination: AVPlayerUIView()) {
                        PageRow(image: "square.and.arrow.up", name: "AVPlayer")
                    }
                    NavigationLink(destination: AVSystemPlayer()) {
                        PageRow(image: "square.and.arrow.down", name: "VideoPlayer")
                    }
                    NavigationLink(destination: AVPlayerControllerView()) {
                        PageRow(image: "square.and.arrow.up.on.square", name: "AVPlayerController")
                    }
                    NavigationLink(destination: MenuListPage()) {
                        PageRow(image: "list.bullet.below.rectangle", name: "MenuListPage")
                    }
                    NavigationLink(destination: SceneKitView()) {
                        PageRow(image: "guaranisign.square.fill", name: "SceneKit")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Using"), displayMode: .inline)
        }
    }
}

#if DEBUG
struct UsingLists_Previews: PreviewProvider {
    static var previews: some View {
        UsingLists()
    }
}
#endif
