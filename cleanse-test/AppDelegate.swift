//
//  AppDelegate.swift
//  cleanse-test
//
//  Created by engineering on 25/4/22.
//

import UIKit
import Cleanse

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var propertyInjector: PropertyInjector<AppDelegate>?
    var injectorResolver: InjectorResolver?
    var window: UIWindow?

    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Part 7: Firstly we need to create a dependency graph. use this command to built it.
        propertyInjector = try! ComponentFactory.of(AppComponent.self).build(())

        // Part 8: In order to #injectProperties work, call inject properties to ourself (AppDelegate), so you can use this function
        propertyInjector?.injectProperties(into: self)

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
    func injectProperties(object: DummyObject, injectorResolver: InjectorResolver) {
        // Step 6: Here we receive object from the dependency grapth
        dump(object)
        self.injectorResolver = injectorResolver
    }
}
