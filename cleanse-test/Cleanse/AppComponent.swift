//
// Created by msyafiqq on 27/11/20.
// Copyright (c) 2020 beautyfulminds. All rights reserved.
//

import Foundation
import Cleanse

struct AppComponent: Cleanse.RootComponent {
    typealias Root = PropertyInjector<AppDelegate>
    typealias Scope = Singleton

    static func configure(binder: SingletonScope) {
        // Step 1: Here you will begin to create a dependency graph

        // Step 5: Here we register Dummy object to the dependency graph
        // So every dependant that register Dummy Object like we have in AppDelegate.swift#injectProperties(object: DummyObject)
        // The object will be automatically created based on this registration, this file line 21
        binder.bind(DummyObject.self)
                .to {
                    DummyObject(x: 5)
                }
    }

    static func configureRoot(
            binder bind: ReceiptBinder<PropertyInjector<AppDelegate>>
    ) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        // Step 2: Here you need a concrete place where you should place them, so the dependency won't get destroyed
        bind.propertyInjector(configuredWith: AppComponent.configureAppDelegateInjector)
    }
}

extension AppComponent {
    static func configureAppDelegateInjector(
            binder bind: PropertyInjectionReceiptBinder<AppDelegate>
    ) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        // Step 3: Register App Delegate to receive the dependency graph
        bind.to(injector: AppDelegate.injectProperties)
    }
}

class DummyObject {
    init(x: Int) {
        self.x = x
    }

    var x: Int
}
