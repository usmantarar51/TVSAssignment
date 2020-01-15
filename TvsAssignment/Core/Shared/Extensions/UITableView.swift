//
//  UITableView.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

import Foundation

extension UITableView {
    
    func registerNib(from cellClass: UITableViewCell.Type) {
        let identifier = cellClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func registerNibHeaderFooter(from viewClass: UITableViewHeaderFooterView.Type) {
        let identifier = viewClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
    }

    func registerCell(from cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }

    func registerHeaderFooter(from viewClass: UITableViewHeaderFooterView.Type) {
        register(viewClass, forHeaderFooterViewReuseIdentifier: viewClass.identifier)
    }

    func dequeue<T: Any>(cell: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
    
}

