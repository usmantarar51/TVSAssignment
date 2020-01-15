//
//  MapPresenter.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import MapKit

class MapPresenter {
    // MARK: Properties

    weak var view: MapView?
    var router: MapWireframe?
    var interactor: MapUseCase?
}

extension MapPresenter: MapPresentation {
    func viewDidLoad() {
        view?.showLocations(locations: interactor?.generatPositionsArray() ?? [])
    }
    
    func locationDidTapped(model: CityModel) {
        self.navigateToCityWeatherForecast(coordinates: model.coordinate, city: model.name)
    }

    func navigateToCityWeatherForecast(coordinates: CLLocationCoordinate2D, city: String) {
        let cityWeatherVC = WeatherForecastDetailRouter.setupModule()
        cityWeatherVC.coordinates = coordinates
        cityWeatherVC.cityname = city
        router?.navigateToViewController(vc: cityWeatherVC)
    }
}

extension MapPresenter: MapUseCaseOutput {
    // TODO: implement interactor output methods
}
