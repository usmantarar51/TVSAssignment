//
//  Double.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 14/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

extension Double {

    func fahrToCelsius() -> Int {
        let celsius = Int((self - 32) * 0.55)
        return celsius as Int
    }
}
