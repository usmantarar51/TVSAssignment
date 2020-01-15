//
//  RootRouter.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = BaseNavigationController(rootViewController: MapRouter.setupModule())
    }

    func setupAppRoot() {
        UIApplication.shared.keyWindow?.rootViewController = BaseNavigationController(rootViewController: MapRouter.setupModule())

        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
