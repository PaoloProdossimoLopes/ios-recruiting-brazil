//
//  MovieViewModel.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import Foundation
import UIKit

protocol MovieViewModelProtocol {
    var movieModels: [MovieModel] { get }
    var controllerDelegate: MovieViewModelToController? { get set }
    func fetchMovies()
    func filterListOfMovies(_ text: String)
    func didSelectViewToShowDetail(id: Int)
}

protocol MovieViewModelToController: AnyObject {
    func updateController()
}

protocol MovieViewModelToCoordinator: AnyObject {
    func didSelectMovie(with id: Int)
}

final class MovieViewModel: MovieViewModelProtocol {

    weak var controllerDelegate: MovieViewModelToController?
    weak var coordinatorDelegate: MovieViewModelToCoordinator?
    
    private let service: MovieServiceProtocol
    
    private(set) var movieModels: [MovieModel] = []
    private var movieListModels: [MovieModel] = []
    
    init(_ delegate: MovieViewModelToCoordinator, service: MovieServiceProtocol) {
        self.coordinatorDelegate = delegate
        self.service = service
    }
    
    func fetchMovies() {
        service.fetchMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.movieListModels = response.results.map { MovieModel(respone: $0) }
                self.movieModels = self.movieListModels
                self.controllerDelegate?.updateController()
            case .failure(_):
                break
            }
        }
    }
    
    func filterListOfMovies(_ text: String) {
        if text.isEmpty {
            movieModels = movieListModels
        } else {
            movieModels = movieListModels.filter { $0.movieName.contains(text) }
        }
        controllerDelegate?.updateController()
    }
    
    func didSelectViewToShowDetail(id: Int) {
        coordinatorDelegate?.didSelectMovie(with: id)
    }
}
