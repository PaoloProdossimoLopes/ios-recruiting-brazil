//
//  MovieModel.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 16/04/22.
//


struct MovieModel {
    
    private let respone: MovieResultsResponseModel
    
    init(respone: MovieResultsResponseModel) {
        self.respone = respone
    }
    
    var id: Int { respone.id }
    var movieName: String { respone.title }
    var mobieBanner: String {
        let base = Constants.baseImageAPIString
        let urlString = base + (respone.posterPath ?? .emptyText)
        return urlString
    }
}
