//
//  RootContract.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

enum AppState: String {
    case SplashCompleted
    case TutorialCompleted
    case LoadHomeScreen
}

protocol RootWireframe: class {
    func presentRootScreen(in window: UIWindow)
}
