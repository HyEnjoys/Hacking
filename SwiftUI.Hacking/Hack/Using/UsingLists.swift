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
                Section(header: Text("Wave")) {
                    NavigationLink(destination:
                        SineWaveView(
                            circleLineWidth: 1.0,
                            strokeColor: .constant(Color.blue),
                            color1: .constant(
                                Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
                                    .opacity(0.7)
                            ),
                            color2: .constant(
                                Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
                                    .opacity(0.9)
                            ),
                            color3: .constant(
                                Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
                            )
                        )
                    ) {
                        PageRow(image: "water.waves.slash", name: "Sea Wave")
                    }
                    NavigationLink(destination: SireWaveView()) {
                        PageRow(image: "water.waves.and.arrow.down", name: "Siri Wave")
                    }
                    NavigationLink(destination: LineWaveView()) {
                        PageRow(image: "water.waves", name: "Line Wave")
                    }
                }
                Section(header: Text("UIKit")) {
                    NavigationLink(destination: ActivityIndicatorView()) {
                        PageRow(image: "arrow.2.circlepath", name: "ActivityIndicator")
                    }
                    NavigationLink(destination: AVPlayerUIView()) {
                        PageRow(image: "square.and.arrow.up", name: "AVPlayer")
                    }
                    NavigationLink(destination: AVPlayerControllerView()) {
                        PageRow(image: "square.and.arrow.up.on.square", name: "AVPlayerController")
                    }
                    NavigationLink(destination: PageControlView()) {
                        PageRow(image: "arrow.2.circlepath", name: "PageControl")
                    }
                    NavigationLink(destination: PageViewController_Previews.previews) {
                        PageRow(image: "lasso", name: "PageViewController")
                    }
                    NavigationLink(destination: SceneKitView()) {
                        PageRow(image: "guaranisign.square.fill", name: "SceneKit")
                    }
                }
                
                Section(header: Text("Examples")) {
                    NavigationLink(destination: ChatPage()) {
                        PageRow(image: "circle.dotted", name: "Chat")
                    }
                    NavigationLink(destination: AirplanePage()) {
                        PageRow(name: "Airplane")
                    }
                    NavigationLink(destination: AnimatableCardsPage()) {
                        PageRow(image: "creditcard", name: "AnimatableCards")
                    }
                    NavigationLink(destination: GestureImagePage()) {
                        PageRow(image: "tengesign.circle", name: "GestureImage")
                    }
                    NavigationLink(destination: FoldPageView()) {
                        PageRow(image: "circle.dashed", name: "Fold Animate")
                    }
                    NavigationLink(destination: DownloadImagePage()) {
                        PageRow(image:"square.and.arrow.down", name: "DownloadImage")
                    }
                    NavigationLink(destination: PreferencePage()) {
                        PageRow(image: "square.and.arrow.down", name: "Prederence")
                    }
                    NavigationLink(destination: MenuListPage()) {
                        PageRow(image: "list.bullet.below.rectangle", name: "MenuListPage")
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
