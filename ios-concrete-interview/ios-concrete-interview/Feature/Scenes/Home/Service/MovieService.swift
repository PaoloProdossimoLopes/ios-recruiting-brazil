//
//  MovieService.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(_ completion: @escaping ((Result<MovieResponseModel, APIErrors>) -> Void))
}

final class MovieService: RequestPerformer, MovieServiceProtocol {
    
    func fetchMovies(_ completion: @escaping ((Result<MovieResponseModel, APIErrors>) -> Void)) {
        let request = MovieRequest()
        perform(request: request, completion)
    }
}


