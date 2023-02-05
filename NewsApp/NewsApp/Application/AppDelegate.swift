//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Daniil Konashenko on 03.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let windowNavigation = UINavigationController(rootViewController: TableNewsAssembly.configure())
        windowNavigation.navigationBar.prefersLargeTitles = true
        
        let window = UIWindow()
        window.rootViewController = windowNavigation
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

