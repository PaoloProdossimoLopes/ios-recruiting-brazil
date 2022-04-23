//
//  Coordinator.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

protocol Coordinator {
    var childrens: [Coordinator] { get }
    var rootViewController: UIViewController? { get }
    func start()
}
