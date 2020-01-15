//
//  BaseTableViewHeaderFooterView.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView {
    func updateView(rowModel: Any?) {
        preconditionFailure("You have to override updateCell")
    }
}
