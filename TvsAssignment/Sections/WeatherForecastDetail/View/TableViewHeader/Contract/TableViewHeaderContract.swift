//
//  TableViewHeaderContract.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

import Foundation

protocol TableViewHeaderView: class {
    // TODO: Declare view methods
    func rowModelsGenerated(rowModels: [BaseRowModel])
}

protocol TableViewHeaderPresentation: class {
    func generateRowModels(hourlyForcast: Daily)
}
