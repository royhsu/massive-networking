//
//  AppDelegate.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/17.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - AppDelegate

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    
    var window: UIWindow?
    
}

// MARK: UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    )
    -> Bool {
        
        let window = UIWindow()
        
        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )
        
        let postViewController = storyboard.instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
        
        postViewController.postProvider = PostManager()
        
        window.rootViewController = postViewController
        
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
        
    }

}
