//
//  Reusable.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String { String(describing: self) }
}
