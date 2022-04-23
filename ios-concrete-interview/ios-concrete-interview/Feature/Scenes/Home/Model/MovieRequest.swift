//
//  MovieRequest.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

struct MovieRequest: Request {
    let baseURL: String = "https://api.themoviedb.org/3/discover/movie?api_key=56bad2f26e66e3a7bbad92107dbe44d1"
    var url: String { baseURL }
}
