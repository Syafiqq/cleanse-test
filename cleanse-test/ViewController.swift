//
//  ViewController.swift
//  cleanse-test
//
//  Created by engineering on 25/4/22.
//

import UIKit

class ViewController: UIViewController {
    // Step 14: In order to get this object from dependency we can use two option.
    // 1. Register the ViewController to the dependency graph
    // 2. Using the property injection
    // We can't use the number 1 because the VC intitialization is not created by us, so for this sceneario we use the property injector
    var repoA: RepositoryA?
    var repoB: RepositoryB?
    var repoC: RepositoryC?
    var repoD: RepositoryD?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Step 15: Inorder to create a property injector, first we need a place to receive the data from the dependency graph
    func injectProperties(repoA: RepositoryA, repoB: RepositoryB, repoC: RepositoryC, repoD: RepositoryD) {
        self.repoA = repoA
        self.repoB = repoB
        self.repoC = repoC
        self.repoD = repoD

        dump("ViewController - injectProperties")
        dump(repoA)
        dump(repoB)
        dump(repoC)
        dump(repoD)
    }

}

