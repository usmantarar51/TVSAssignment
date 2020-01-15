//
//  AppSetup.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

extension AppDelegate {
    // Here you can SetupApp basic enviroment
    internal func setupApp(window: UIWindow) {
        _boot()
    }

    internal func _boot() {
        if let window = self.window {
            window.backgroundColor = .white
            RootRouter().presentRootScreen(in: window)
        }
    }

    @objc internal func _reboot() {
        RootRouter().setupAppRoot()
    }
}
