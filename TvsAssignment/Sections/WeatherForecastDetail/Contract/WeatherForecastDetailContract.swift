//
//  WeatherForecastDetailContract.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import MapKit

protocol WeatherForecastDetailView: Loadable {
    // TODO: Declare view methods
    func rowModelsGenerated(rowModels: [BaseRowModel])
    func updateCityDetails(forecast: ForecastModel)
    func showError(error: Error)
}

protocol WeatherForecastDetailPresentation: class {
    func viewDidLoad(coordinates: CLLocationCoordinate2D?)
}

protocol WeatherForecastDetailUseCase: class {
    func fetchWeatherDetails(latitude: Double, longitude: Double)
}

protocol WeatherForecastDetailUseCaseOutput: class {
    func weatherDetailReceived(response: ForecastModel)
    func error(error: Error)
}

protocol WeatherForecastDetailWireframe: class {
    // TODO: Declare wireframe methods
}
