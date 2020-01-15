//
//  BaseTableViewCell.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    func updateCell(rowModel: BaseRowModel) {
        preconditionFailure("You have to override updateCell")
    }
}
