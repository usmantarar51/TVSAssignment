//
//  WeatherForecastDetailServices.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Alamofire
import Foundation

class WeatherForecastDetailServices {
    internal func executeForcastDetail(latitude: Double, longitude: Double, completionHandler: @escaping (DataResponse<ForecastModel>) -> ()) {
        let route = APIRouter.forecast(latitudes: latitude, longitude: longitude)

        APIClient.performGet(route: route) { (handler: DataResponse<ForecastModel>) in
            completionHandler(handler)
        }
    }
}
