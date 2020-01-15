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
        
        for dailyData in response.daily?.data ?? [] {
            let rowModel = BaseRowModel()
            rowModel.rowCellIdentifier = "DailyReportTableViewCell"
            rowModel.rowValue = dailyData
            rowModel.rowHeight = 40
            rowModels.append(rowModel)
        }
        
        if let summary = response.daily?.summary {
            let rowModel = BaseRowModel()
            rowModel.rowCellIdentifier = "SummaryTableViewCell"
            rowModel.rowValue = summary
            rowModel.rowHeight = 70
            rowModels.append(rowModel)
        }
        
        if let dailyData = response.daily?.data?[0] {
            let rowModel = BaseRowModel()
            rowModel.rowCellIdentifier = "SunriseInfoCellTableViewCell"
            rowModel.rowValue = dailyData
            rowModel.rowHeight = 70
            rowModels.append(rowModel)
        }
        
        view?.rowModelsGenerated(rowModels: rowModels)
    }
}
