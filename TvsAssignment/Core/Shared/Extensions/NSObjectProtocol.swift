//
//  NSObjectProtocol+Additions.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
    static var identifier: String { return String(describing: self) }
}
