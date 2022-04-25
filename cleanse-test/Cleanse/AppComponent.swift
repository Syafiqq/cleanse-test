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
    }

    static func configureRoot(
            binder bind: ReceiptBinder<PropertyInjector<AppDelegate>>
    ) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        // Step 2: Here you need a concrete place where you should place them, so the dependency won't get destroyed
        fatalError()
    }
}
