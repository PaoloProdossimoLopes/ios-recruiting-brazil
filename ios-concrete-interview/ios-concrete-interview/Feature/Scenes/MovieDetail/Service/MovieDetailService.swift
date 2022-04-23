//
//  MovieDetailService.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

import Foundation

protocol MovieDetailServiceProtocol {
    func fetchMovieDetails(
        _ completion: @escaping ((Result<MovieDetailResponseModel, APIErrors>) -> Void)
    )
}

final class MovieDetailService: RequestPerformer, MovieDetailServiceProtocol {
    
    private let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func fetchMovieDetails(
        _ completion: @escaping ((Result<MovieDetailResponseModel, APIErrors>) -> Void)
    ) {
        let request = MovieDetailRequest(id: movieId)
        perform(request: request, completion)
    }
}
