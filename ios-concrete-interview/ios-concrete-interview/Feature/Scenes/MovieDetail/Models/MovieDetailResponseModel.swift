//
//  MovieDetailResponseModel.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

struct MovieDetailResponseModel: Codable {
    let id: Int
    let genrer: [MovieDetailsGenrerResponseModel]
    let title: String
    let overview: String
    let posterPath: String
    let points: Double
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case genrer = "genres"
        case title = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case points = "vote_average"
        case releaseDate = "release_date"
    }
}

struct MovieDetailsGenrerResponseModel: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
