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
public final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Property

    public final let window = UIWindow(frame: UIScreen.main.bounds)

    // MARK: UIApplicationDelegate

    public final func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    )
    -> Bool {

        window.rootViewController = UINavigationController(
            rootViewController: ViewController()
        )

        window.makeKeyAndVisible()

        return true

    }

}
