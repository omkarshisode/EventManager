//
//  SceneDelegate.swift
//  UIKitComponet
//
//  Created by Omkar Shisode on 18/12/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let rootViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        setUpTabBar()
        window?.makeKeyAndVisible()
    
    }
    
    private func setUpTabBar() {
        let tabBarViewController = UITabBarController()
        
        let viewController = ViewController()
        viewController.title = "Main"
        
        let imageViewController = ImageViewController()
        imageViewController.title =  "Images"
        
        let collectionViewController = ContractListViewController()
        collectionViewController.title = "Contract List"
        
        let scrollViewController = ScrollViewController()
        scrollViewController.title = "Scroll View"
        
        let pickerViewController = PickerViewController()
        pickerViewController.title = "Picker View"
        
        // Temparory icon practice purpose
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        imageViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        collectionViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        scrollViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 3)
        pickerViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 4)
        
        let controllers = [viewController, imageViewController, collectionViewController, scrollViewController, pickerViewController]
        
        // Set UI navigation for each controller
        tabBarViewController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        
        window?.rootViewController = tabBarViewController
        
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

