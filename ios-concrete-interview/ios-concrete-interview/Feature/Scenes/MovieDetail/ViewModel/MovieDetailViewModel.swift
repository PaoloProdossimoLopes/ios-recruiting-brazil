//
//  MovieDetailViewModel.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

import Foundation
import UIKit

protocol MovieDetailViewModelProtocol {
    func fetchMovieDetails()
    var controllerDelegate: MovieDetailViewModelToController? { get set }
}

protocol MovieDetailViewModelToCoordinator: AnyObject {
    
}

protocol MovieDetailViewModelToController: AnyObject {
    func updateView(_ model: MovieDetailModel?)
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    private let service: MovieDetailServiceProtocol
    
    weak var coordinatorDelegate: MovieDetailViewModelToCoordinator?
    weak var controllerDelegate: MovieDetailViewModelToController?
    
    private var movieDetailModel: MovieDetailModel?
    
    init(delegate: MovieDetailViewModelToCoordinator, service: MovieDetailServiceProtocol) {
        self.coordinatorDelegate = delegate
        self.service = service
    }
    
    func fetchMovieDetails() {
        service.fetchMovieDetails { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.movieDetailModel = .init(response: response)
                print(MovieDetailModel.init(response: response))
            case .failure(_):
                break
            }
            
            self.controllerDelegate?.updateView(self.movieDetailModel)
        }
    }
}
