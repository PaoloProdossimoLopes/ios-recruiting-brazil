//
//  FavoritesCoordinator.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

final class FavoritesCoordinator: Coordinator {
    
    private(set) var childrens: [Coordinator] = []
    private(set) var rootViewController: UIViewController?
    
    private(set) var controller: FavoritesViewController?
    
    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        controller = makeController()
    }
    
    //MARK: - Helpers
    private func makeController() -> FavoritesViewController {
        let service = FavoritesService()
        let viewModel = FavoritesViewModel(service: service)
        let contentView = FavoritesView()
        let viewController = FavoritesViewController(contentView, viewModel: viewModel)
        return viewController
    }
}
