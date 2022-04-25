//
// Created by engineering on 25/4/22.
//

import Foundation

protocol InjectorResolver: AnyObject {
    // Step 17-2: Register ViewController propertyInjector
    func inject(_ viewController: ViewController)
}
