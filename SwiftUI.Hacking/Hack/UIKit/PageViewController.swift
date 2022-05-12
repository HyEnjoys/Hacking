//
//  PageViewController.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/15.
//  Copyright © 2019 Yuan. All rights reserved.
//

import UIKit
import SwiftUI

let images = ["timer", "umbrella", "flame", "burst", "headphones"]

struct PageViewController<Page: View>: View {

    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageController(controllers: viewControllers, currentPage: $currentPage)
        }
        .navigationBarTitle("PageViewController")
    }
}

#if DEBUG
struct PageViewController_Previews: PreviewProvider {
        
    static var previews: some View {
        PageViewController(
            images.map {
                PageCard(image: $0)
            }
        )
    }
}
#endif

struct PageController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pagevc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pagevc.dataSource = context.coordinator
        pagevc.delegate = context.coordinator
        return pagevc
    }
    
    func updateUIViewController(_ pageController: UIPageViewController, context: Context) {
        pageController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
        var parent: PageController
        
        init(_ pageViewController: PageController) {
            self.parent = pageViewController
        }
        
        // 后退
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }
        // 前进
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == parent.controllers.count - 1 {
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }
        
        // 动画完成
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            guard completed,
                let visiableVC = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visiableVC)
                else {
                    return
            }
            parent.currentPage = index
        }
    }
}

// 单一卡片
struct PageCard: View {
    var image: String
    var body: some View {
        ZStack {
            graident()
            VStack {
                Image(systemName: image).font(.title).padding()
                Text(image).font(.largeTitle).bold()
            }
        }
        .frame(width: 200, height: 200)
        .cornerRadius(20)
    }
    
    func graident() -> some View {
        LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom)
    }
}
