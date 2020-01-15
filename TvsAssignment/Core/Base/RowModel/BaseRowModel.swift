//
//  BaseRowModel.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseRowModel: NSObject {
    // Row Item
    var rowCellIdentifier = ""
    var rowValue: Any?
    var rowHeight: CGFloat = 0.0
    var rowWidth: CGFloat = 0.0
}

class BaseSectionModel: NSObject {
    // Row Item
    var sectionCellIdentifier = ""
    var rowItems: [BaseRowModel] = []
    var sectionHeight: CGFloat = 0.0
    var sectionValue: Any?
}
