//
//  WeatherForecastDetailRouter.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import UIKit

class WeatherForecastDetailRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> WeatherForecastDetailViewController {
        let viewController = WeatherForecastDetailViewController.instantiate(fromAppStoryboard: .WeatherForecastDetail)
        let presenter = WeatherForecastDetailPresenter()
        let router = WeatherForecastDetailRouter()
        let interactor = WeatherForecastDetailInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension WeatherForecastDetailRouter: WeatherForecastDetailWireframe {
    // TODO: Implement wireframe methods
}
