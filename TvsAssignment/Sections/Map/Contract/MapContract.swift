//
//  MapContract.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import MapKit
import UIKit

protocol MapView: Loadable {
    // TODO: Declare view methods
    func showLocations(locations: [CityModel])
}

protocol MapPresentation: class {
    func viewDidLoad()
    func locationDidTapped(model: CityModel)
    func navigateToCityWeatherForecast(coordinates: CLLocationCoordinate2D, city: String)
}

protocol MapUseCase: class {
    // TODO: Declare use case methods

    func generatPositionsArray() -> [CityModel]
}

protocol MapUseCaseOutput: class {
    // TODO: Declare interactor output methods
}

protocol MapWireframe: class {
    // TODO: Declare wireframe methods
    func navigateToViewController(vc: UIViewController)
}
