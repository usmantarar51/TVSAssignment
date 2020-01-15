//
//  WeatherForecastDetailPresenter.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import MapKit

class WeatherForecastDetailPresenter {
    // MARK: Properties

    weak var view: WeatherForecastDetailView?
    var router: WeatherForecastDetailWireframe?
    var interactor: WeatherForecastDetailUseCase?
}

extension WeatherForecastDetailPresenter: WeatherForecastDetailPresentation {
    func viewDidLoad(coordinates: CLLocationCoordinate2D?) {
        if let coordinates = coordinates {
            view?.showLoading()
            interactor?.fetchWeatherDetails(latitude: coordinates.latitude, longitude: coordinates.longitude)
        }
    }
}

extension WeatherForecastDetailPresenter: WeatherForecastDetailUseCaseOutput {
    func error(error: Error) {
        view?.hideLoading()
        view?.showError(error: error)
    }

    func weatherDetailReceived(response: ForecastModel) {
        view?.hideLoading()
        view?.updateCityDetails(forecast: response)

        var rowModels: [BaseRowModel] = []

        if let dailyData = response.daily?.data {
            rowModels.append(contentsOf: DailyReportTableViewCell.rowModels(data: dailyData))
        }

        if let summary = response.daily?.summary {
            rowModels.append(SummaryTableViewCell.rowModel(data: summary))
        }

        if let dailyData = response.daily?.data?[0] {
            rowModels.append(SunriseInfoCellTableViewCell.rowModel(data: dailyData))
        }

        view?.rowModelsGenerated(rowModels: rowModels)
    }
}
