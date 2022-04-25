//
//  AppDelegate.swift
//  cleanse-test
//
//  Created by engineering on 25/4/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()

        return true
    }

    func application(
            _ app: UIApplication,
            open url: URL,
            options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        true
    }

    func application(
            _ application: UIApplication,
            open url: URL,
            sourceApplication: String?,
            annotation: Any
    ) -> Bool {
        false
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

extension AppDelegate {
    // Since we don't control creation of our AppDelegate, we have to use "property injection" to populate
    // our required properties
    // Here we need at least one object to be created
    func injectProperties(object: DummyObject) {
        // Step 6: Here we receive object from the dependency grapth
        dump(object)
    }
}
