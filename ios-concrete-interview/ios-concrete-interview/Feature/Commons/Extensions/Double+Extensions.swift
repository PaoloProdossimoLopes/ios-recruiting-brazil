//
//  Double+Extensions.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

import Foundation

extension Double {
    var rate: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = true
        numberFormatter.currencyDecimalSeparator = ","
        numberFormatter.locale = .init(identifier: "pt-br")
        numberFormatter.positiveSuffix = " pontos"
        numberFormatter.positivePrefix = "Nota: "
        return numberFormatter.string(from: self as NSNumber) ?? .emptyText
    }
}
