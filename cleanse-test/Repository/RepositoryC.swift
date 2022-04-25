//
// Created by engineering on 25/4/22.
//

import Foundation

class RepositoryC {
    var repoA: RepositoryA
    var repoB: RepositoryB
    let value: Int

    init(repoA: RepositoryA, repoB: RepositoryB) {
        self.repoA = repoA
        self.repoB = repoB
        value = repoB.value * 1000 + repoA.value
    }
}
