//
//  Constants.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Foundation
import UIKit

enum Environment {
    case stagging
    
    var baseURL: String {
        switch self {
        case .stagging:
            return "https://api.darksky.net/"
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .stagging:
            return ["Content-Type": "application/json"]
        }
    }
    
    var secretKey: String {
        switch self {
        case .stagging:
            return "2d8c8c6571988b81965b115d54b3ff72/"
        }
    }
}

struct Endpoints {
    static let forecast = "forecast"
}


struct ScreenSize {
    static let BASE_SCREEN_HEIGHT: CGFloat = 667.0
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
    static let maxWH = max(ScreenSize.width, ScreenSize.height)
    static let minWH = min(ScreenSize.width, ScreenSize.height)
    static let ASPECT_RATIO_RESPECT = maxWH / minWH
}

struct DeviceType {
    static let iPhone4orLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH < 568.0
    static let iPhone5orSE = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 568.0
    static let iPhone678 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 667.0
    static let iPhone678p = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 736.0
    static let iPhone8orLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH <= 667.0
    static let iPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 812.0
    static let iPhoneXRMax = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxWH == 896.0
    static var hasNotch: Bool {
        return iPhoneX || iPhoneXRMax
    }
}
