//
// Created by engineering on 25/4/22.
//

import Foundation
import Cleanse

class MainInjectorResolver: InjectorResolver {
    // Step 17-3: Register ViewController propertyInjector properties
    private let viewControllerInjector: Provider<PropertyInjector<ViewController>>

    // Step 17-4: Register dependencies
    init(viewControllerInjector: Provider<PropertyInjector<ViewController>>) {
        self.viewControllerInjector = viewControllerInjector
    }

    func inject(_ viewController: ViewController) {
        // Step 17-5: Call property injector to the view controller
        viewControllerInjector.get().injectProperties(into: viewController)
    }
}
