//
//  MovieResponseModel.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 16/04/22.
//

import Foundation

struct MovieResponseModel: Codable {
    let page: Int
    let results: [MovieResultsResponseModel]
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
    }
}

struct MovieResultsResponseModel: Codable {
    let id: Int
    let title: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "original_title"
        case posterPath = "poster_path"
    }
}
