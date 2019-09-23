//
//  AppDelegate.swift
//  Passthrough
//
//  Created by Alan Casas on 23/09/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        if #available(iOS 13.0, *) {
            let rootVC = MainViewController()
            rootVC.view.backgroundColor = UIColor.cyan            
            window?.rootViewController = rootVC
        } else {
            // Fallback on earlier versions
        }
        return true
    }

}

