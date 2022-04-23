//
//  MovieCoordinator.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

protocol MovieCoordinatorProtocol {
    
}

final class MovieCoordinator: Coordinator, MovieCoordinatorProtocol {
    
    //MARK: - Properties
    private(set) var childrens: [Coordinator] = []
    private(set) var rootViewController: UIViewController?
    
    private(set) var controller: MovieViewController?
    
    //MARK: - Constructor
    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        controller = makeController()
    }
    
    //MARK: - Helpers
    private func makeController() -> MovieViewController {
        let service = MovieService()
        let viewModel = MovieViewModel(self, service: service)
        let contentView = MovieView()
        let viewController = MovieViewController(contentView, viewModel: viewModel)
        return viewController
    }
}

extension MovieCoordinator: MovieViewModelToCoordinator {
    func didSelectMovie(with id: Int) {
        guard let rootController = controller else { return }
        let movieDetailCoordinator = MovieDetailCoordinator(
            rootViewController: rootController, movieId: id
        )
        movieDetailCoordinator.start()
        childrens.append(movieDetailCoordinator)
    }
}
