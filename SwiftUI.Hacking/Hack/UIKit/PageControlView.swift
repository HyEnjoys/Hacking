//
//  PageControlView.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import UIKit
import SwiftUI

struct PageControlView: View {
    @State var page: Int = 0
    
    var body: some View {
        ZStack {
            Color.white // 背景
            VStack {
                PageControl(numberOfPages: 10, color: UIColor.gray, tintColor: UIColor.green, currentPage: self.$page)
                    .offset(CGSize(width: 50, height: 0)) // 偏移
                
                Button(action: {
                    self.page = Int.random(in: 0..<10)
                }) {
                    Text("Select Change \(self.page)").bold().italic().font(.largeTitle)
                }
            }
        }
        .navigationBarTitle("PageControl")
    }
}

#if DEBUG
struct PageControlView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView()
    }
}
#endif

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    var color: UIColor = .white
    var tintColor: UIColor = .white
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = color
        pageControl.currentPageIndicatorTintColor = tintColor
        pageControl.numberOfPages = numberOfPages
        pageControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return pageControl
    }

    func updateUIView(_ pageControl: UIPageControl, context: Context) {
        pageControl.currentPage = currentPage
    }

    class Coordinator: NSObject {
        var pageControl: PageControl

        init(_ pageControl: PageControl) {
            self.pageControl = pageControl
        }

        @objc func updateCurrentPage(sender: UIPageControl) {
            pageControl.currentPage = sender.currentPage
        }
    }
}
