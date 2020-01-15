//
//  CityModel.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import MapKit
import UIKit

class CityModel: NSObject, MKAnnotation {
    // MARK: - Model Variables

    var name: String
    var coordinate: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid

    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }
}
