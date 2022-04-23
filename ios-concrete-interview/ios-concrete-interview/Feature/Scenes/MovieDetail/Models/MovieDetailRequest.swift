//
//  MovieDetailRequest.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

struct MovieDetailRequest: Request {
    
    private let id: Int
    private let placeholder: String = "{movie_id}"
    var baseURL: String = "https://api.themoviedb.org/3/movie/{movie_id}?api_key=56bad2f26e66e3a7bbad92107dbe44d1&language=en-US"
    
    init(id: Int) {
        self.id = id
    }

    var url: String {
        return baseURL.replacingOccurrences(of: placeholder, with: "\(id)")
    }
}
