//
//  VideoPlayer.swift
//  SwiftUI.Hacking
//
//  Created by 大大 on 2020/12/9.
//  Copyright © 2020 Yuan. All rights reserved.
//

import SwiftUI
import AVKit
import UIKit

struct AVSystemPlayer: View {
    var body: some View {
        VStack {
            /// 14的新出控件
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "luoye", withExtension: "mp4")!))
                /// .padding()
                                   
//            VideoPlayer(player: AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)) {
//                VStack {
//                    Text("Watermark")
//                        .font(.caption)
//                        .foregroundColor(.white)
//                        .background(Color.black.opacity(0.7))
//                        .clipShape(Capsule())
//                    Spacer()
//                }
//            }
//            .padding()
        }
    }
}

struct AVSystemPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AVSystemPlayer()
    }
}
