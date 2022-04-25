//
// Created by engineering on 25/4/22.
//

import Cleanse

// Refer to this: https://github.com/square/Cleanse#scope-step
// This will make sure we have a singleton scope through the app lifecycle
typealias SingletonScope = Binder<Singleton>
