//
//  AppDelegate.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/26.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.initializeRootViewController();
        AMapServices.shared().apiKey = MAP_KEY
        self.window?.makeKeyAndVisible()
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    func initializeRootViewController() {
        self.window?.backgroundColor = UIColor.white
        self.window = UIWindow(frame: UIScreen.main.bounds)        
        self.window?.rootViewController = UINavigationController.init(rootViewController: LoginViewController())
    }
}

