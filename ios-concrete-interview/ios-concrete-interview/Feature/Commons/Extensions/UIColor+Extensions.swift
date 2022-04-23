//
//  UIColor+Extensions.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

extension UIColor {
    static var yellowApp: UIColor { .makeColor(red: 240, green: 208, blue: 110) }
    static var darkYellowApp: UIColor { .makeColor(red: 216, green: 169, blue: 61) }
    
    private static func makeColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        .init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
