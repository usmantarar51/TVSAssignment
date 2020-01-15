//
//  TableViewHeaderPresenter.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class TableViewHeaderPresenter: NSObject {
    weak var view: TableViewHeaderView?
}

extension TableViewHeaderPresenter: TableViewHeaderPresentation {
    func generateRowModels(hourlyForcast: Daily) {
        var rowModels: [BaseRowModel] = []

        if let dataArray = hourlyForcast.data {
            for data in dataArray {
                rowModels.append(HourlyForcastCollectionCell.rowModel(data: data))
            }
        }
        view?.rowModelsGenerated(rowModels: rowModels)
    }
}
