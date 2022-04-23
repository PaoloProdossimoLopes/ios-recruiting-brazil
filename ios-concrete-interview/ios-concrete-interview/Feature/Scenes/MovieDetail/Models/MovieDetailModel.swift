//
//  MovieDetailModel.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

struct MovieDetailModel {
    
    private let response: MovieDetailResponseModel
    
    init(response: MovieDetailResponseModel) {
        self.response = response
    }
    
    var movieTitle: String { response.title }
    var movieOverview: String { response.overview }
    var movieRate: String { response.points.rate }
    var movieImageURL: String { Constants.baseImageAPIString + response.posterPath }
    var movieReleaseDate: String { response.releaseDate.formatDate }
}
