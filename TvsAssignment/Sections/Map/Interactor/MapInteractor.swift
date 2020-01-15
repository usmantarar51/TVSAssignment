//
//  MapInteractor.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import MapKit

class MapInteractor {
    // MARK: Properties

    weak var output: MapUseCaseOutput?
    let services = MapServices()
}

extension MapInteractor: MapUseCase {
    // TODO: Implement use case methods

    func generatPositionsArray() -> [CityModel] {
        var cities = [CityModel]()

        cities.append(CityModel(name: "Dubai", coordinate: CLLocationCoordinate2D(latitude: 25.2048, longitude: 55.2708)))
        cities.append(CityModel(name: "Abu Dhabi", coordinate: CLLocationCoordinate2D(latitude: 24.4539, longitude: 54.3773)))
        cities.append(CityModel(name: "Sharjah", coordinate: CLLocationCoordinate2D(latitude: 25.3463, longitude: 55.4209)))
        cities.append(CityModel(name: "Lahore", coordinate: CLLocationCoordinate2D(latitude: 31.5204, longitude: 74.3587)))
        cities.append(CityModel(name: "Karachi", coordinate: CLLocationCoordinate2D(latitude: 24.8607, longitude: 67.0011)))
        cities.append(CityModel(name: "Islamabad", coordinate: CLLocationCoordinate2D(latitude: 33.6158004, longitude: 72.8059198)))
        cities.append(CityModel(name: "Multan", coordinate: CLLocationCoordinate2D(latitude: 30.196789, longitude: 71.478241)))

        return cities
    }
}
