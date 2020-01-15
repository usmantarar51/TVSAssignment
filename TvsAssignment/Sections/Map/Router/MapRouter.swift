//
//  MapRouter.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import UIKit

class MapRouter {
    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> MapViewController {
        let viewController = MapViewController.instantiate(fromAppStoryboard: .Map)
        let presenter = MapPresenter()
        let router = MapRouter()
        let interactor = MapInteractor()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension MapRouter: MapWireframe {
    func navigateToViewController(vc: UIViewController) {
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
