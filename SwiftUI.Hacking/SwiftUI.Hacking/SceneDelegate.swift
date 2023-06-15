//
//  SceneDelegate.swift
//  SwiftUI.Hacking
//
//  Created by Enjoy on 2019/8/14.
//  Copyright © 2019 Yuan. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

class HostingController: UIHostingController<ContentView> {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let state = TabBarState()
            //
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(state))
            self.window = window
            window.makeKeyAndVisible()
            
            //监听TabBarState状态
            state.$hidden.receive(subscriber: AnySubscriber(receiveSubscription: { (sub) in
                sub.request(.unlimited)
            }, receiveValue: { (value) -> Subscribers.Demand in
                self.tabBarHidden(value)
                return .none
            }))
        }
    }
    
    func tabBarHidden(_ hidden: Bool) {
        let controllers = self.window?.rootViewController?.children ?? []
        for controller in controllers {
            if controller.isKind(of: UITabBarController.self), let tab = controller as? UITabBarController {
                if tab.tabBar.isHidden != hidden {
                    tab.tabBar.isHidden = hidden
                }
                return
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
//// SceneDelegate.swift
//   func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//       // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
//       // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
//       // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//
//       // Create the SwiftUI view that provides the window contents.
//       let contentView = ContentView()
//       // Use a UIHostingController as window root view controller.
//       if let windowScene = scene as? UIWindowScene {
//           let window = UIWindow(windowScene: windowScene)
//           let tabBar = TabBarState()
//           window.rootViewController = UIHostingController(rootView: contentView.environmentObject(tabBar))
//           self.window = window
//           window.makeKeyAndVisible()
//

//       }
//   }

   


