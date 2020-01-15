//
//  WeatherForecastDetailInteractor.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation

class WeatherForecastDetailInteractor {
    // MARK: Properties

    weak var output: WeatherForecastDetailUseCaseOutput?
    let services = WeatherForecastDetailServices()
}

extension WeatherForecastDetailInteractor: WeatherForecastDetailUseCase {
    func fetchWeatherDetails(latitude: Double, longitude: Double) {
        services.executeForcastDetail(latitude: latitude, longitude: longitude) { response in
            if let response = response.result.value {
                self.output?.weatherDetailReceived(response: response)
            } else {
                self.output?.error(error: response.error ?? NSError(domain: "Assignment", code: -1, userInfo: ["Error": "Error"]))
            }
        }
    }
}
