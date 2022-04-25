//
// Created by msyafiqq on 27/11/20.
// Copyright (c) 2020 beautyfulminds. All rights reserved.
//

import Foundation
import Cleanse

struct RepositoryModule: Module {
    static func configure(binder: SingletonScope) {
        // Step 5: Here we register Dummy object to the dependency graph
        // So every dependant that register Dummy Object like we have in AppDelegate.swift#injectProperties(object: DummyObject)
        // The object will be automatically created based on this registration, this file line 21
        binder.bind(DummyObject.self)
                .to {
                    DummyObject(x: 5)
                }

        // Step 9: We Register the repository A here, it will looks like the Dummy Object
        binder.bind(RepositoryA.self)
                .to {
                    RepositoryA(value: (0...9).randomElement()!)
                }

        // Step 10: We Register the repository A here, it will looks like the Dummy Object
        // The differences here we marked them as shared in scope, so you will only expect once object alive at a time
        // The result value will be the same whenever you request this object from the graph
        binder.bind(RepositoryB.self)
                .sharedInScope()
                .to {
                    RepositoryB(value: (0...9).randomElement()!)
                }

        // Step 11: If we do this, we exepect the RepoA and RepoB dependency is coming from the DI Graph Itself,
        // We don't care about the dependency, it will be handled by the graph
        binder.bind(RepositoryC.self)
                .to(factory: RepositoryC.init)

        // Step 12: If we do this, the Repository B, will be requested from the graph, but the RepositoryA will be requested from the graph itself
        binder.bind(RepositoryD.self)
                .to {
                    RepositoryD(repoA: $0, repoB: RepositoryB(value: (0...9).randomElement()!))
                }
    }
}


struct AppComponent: Cleanse.RootComponent {
    typealias Root = PropertyInjector<AppDelegate>
    typealias Scope = Singleton

    static func configure(binder: SingletonScope) {
        // Step 1: Here you will begin to create a dependency graph

        // Step 13: Grouping the similar dependency and link the dependency here
        binder.include(module: RepositoryModule.self)

        // Step 16: Register the injector resolver here
        binder.bind(InjectorResolver.self)
                .to(factory: MainInjectorResolver.init)

        // Step 17-1: Register ViewController propertyInjector binder to graph
        binder.bindPropertyInjectionOf(ViewController.self)
                .to(injector: ViewController.injectProperties)
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
