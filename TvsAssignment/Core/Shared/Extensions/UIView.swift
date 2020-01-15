//
//  UIView.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

extension UIView{
    static var nib: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }
}

extension UIView {
    static var identifier: String {
        return NSStringFromClass(self)
    }
}
