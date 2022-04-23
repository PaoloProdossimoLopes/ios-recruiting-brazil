//
//  MovieDetailCoordinator.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

import UIKit

final class MovieDetailCoordinator: Coordinator {
    private(set) var childrens: [Coordinator] = []
    private(set) var rootViewController: UIViewController?
    
    private(set) var controller: MovieDetailViewController?
    private let movieId: Int
    
    init(rootViewController: UIViewController, movieId: Int) {
        self.rootViewController = rootViewController
        self.movieId = movieId
    }
    
    func start() {
        controller = makeMovieDetail()
        guard let viewController = controller else { return }
//        rootViewController?.present(viewController, animated: true, completion: nil)
        rootViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func makeMovieDetail() -> MovieDetailViewController {
        let service = MovieDetailService(movieId: movieId)
        let viewModel = MovieDetailViewModel(delegate: self, service: service)
        let contentView = MovieDetailView()
        let viewController = MovieDetailViewController(contentView: contentView, viewModel: viewModel)
        return viewController
    }
}

//MARK: - MovieDetailViewModelToCoordinator
extension MovieDetailCoordinator: MovieDetailViewModelToCoordinator {
    
}
