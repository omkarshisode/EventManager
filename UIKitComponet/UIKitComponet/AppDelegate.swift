//
//  AppDelegate.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 18/12/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
//        let viewController = ViewController()
//        let rootViewController = UINavigationController(rootViewController: viewController)
//        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

