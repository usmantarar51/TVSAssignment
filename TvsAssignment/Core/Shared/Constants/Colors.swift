//
//  Colors.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

extension UIColor {
    // App Colors
    class func appGrayColor() -> UIColor { return UIColor(hex: "73777E") }
    class func appGrayColor1() -> UIColor { return UIColor(hex: "73777E") }
    class func navigationBarTitleColor() -> UIColor { return appGrayColor() }
    class func navigationBarWhiteTitleColor() -> UIColor { return UIColor.white }
    class func navigationBarBackColor() -> UIColor { return appGrayColor() }
}

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    func withAlpha(_ alpha: Float) -> UIColor {
        guard let components = cgColor.components else {
            return UIColor.black
        }
        
        let r: CGFloat = components[0]
        let g: CGFloat = components[1]
        var b: CGFloat = 1.0
        if components.count > 2 {
            b = components[2]
        }
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}
