//
//  AVPlayerView.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/9/18.
//  Copyright © 2019 Yuan. All rights reserved.
//

import UIKit
import AVKit
import SwiftUI

class AVKitView: UIView {
    
    private var playerItem: AVPlayerItem?
    private var playerController: AVPlayerViewController!
    
    init(frame: CGRect, url: URL) {
        super.init(frame: frame)
        
        self.addPlayer(url: url)
        self.addObserver()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        // remove observe
        playerItem?.removeObserver(self, forKeyPath: "status")
        playerItem?.removeObserver(self, forKeyPath: "loadedTimeRanges")
    }
    
    private func addPlayer(url: URL) {
        
        playerItem = AVPlayerItem(url: url)
        playerController = AVPlayerViewController()
        playerController.player = AVPlayer(playerItem: playerItem)
        playerController.videoGravity = .resizeAspect
        playerController.view.frame = self.bounds
        
        addSubview(playerController.view)
    }
    
    private func addObserver() {
        // 监听loadedTimeRanges属性来监听缓冲进度更新
        playerItem?.addObserver(self,
                                forKeyPath: "loadedTimeRanges",
                                options: .new,
                                context: nil)
        // 监听status属性进行播放
        playerItem?.addObserver(self,
                                forKeyPath: "status",
                                options: .new,
                                context: nil)
    }
    
    public func play( _ stop: Bool = false ) {
        if stop {
            self.playerController.player?.pause()
        } else {
            self.playerController.player?.play()
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard let object = object as? AVPlayerItem  else { return }
        guard let keyPath = keyPath else { return }
        if keyPath == "status" {
            if object.status == .readyToPlay { // 当资源准备好播放，那么开始播放视频
                playerController?.player?.play()
                print("正在播放...，视频总长度:\(formatPlayTime(seconds: CMTimeGetSeconds(object.duration)))")
            } else if object.status == .failed || object.status == .unknown {
                print("播放出错")
            }
        } else if keyPath == "loadedTimeRanges" {
            let loadedTime = availableDurationWithplayerItem()
            print("当前加载进度\(loadedTime)")
        }
    }
    
    // 将秒转成时间字符串的方法，因为我们将得到秒。
    func formatPlayTime(seconds: Float64) -> String {
        let min = Int(seconds / 60)
        let sec = Int(seconds.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", min, sec)
    }
    
    // 计算当前的缓冲进度
    func availableDurationWithplayerItem() -> TimeInterval {
        guard let loadedTimeRanges = playerController.player?.currentItem?.loadedTimeRanges,
            let first = loadedTimeRanges.first else {
                return 0
                // fatalError()
        }
        let timeRange = first.timeRangeValue
        let startSeconds = CMTimeGetSeconds(timeRange.start) // 本次缓冲起始时间
        let durationSecound = CMTimeGetSeconds(timeRange.duration)// 缓冲时间
        let result = startSeconds + durationSecound// 缓冲总长度
        return result
    }
}

struct AVPlayerView: UIViewRepresentable {
    
    let url: URL!
    @Binding var play: Bool
    
    func makeUIView(context: Context) -> UIView {
        return AVKitView(frame: .zero, url: url)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard let playView: AVKitView = uiView as? AVKitView  else {
            return
        }
        playView.play(!play)
    }
}


struct AVPlayerControllerView: View {
    let url = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
    @State var play: Bool = false
    @State var fullPlay: Bool = false
    
    var body: some View {
        VStack {
            Button {
                self.fullPlay = true
            } label: {
                Text("跳转播放").bold().italic().padding()
            }
            
            /// 播放
            /// AVPlayerView(url: url, play: $play).frame(height: 300)
        }
        .background(Color.black)
        .fullScreenCover(isPresented: self.$fullPlay, content: {
            AVPlayerView(url: url, play: $play) /// 直接全屏播放即可
                .edgesIgnoringSafeArea(.all)
        })
        .animation(Animation.easeIn)
        .onAppear {
            self.play.toggle()
        }
    }
}

struct FullScreenPlayer {
    
    let url = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
    @State var play: Bool = false
    
    var body: some View {
        VStack {
            AVPlayerView(url: url, play: $play)
        }
    }
}
