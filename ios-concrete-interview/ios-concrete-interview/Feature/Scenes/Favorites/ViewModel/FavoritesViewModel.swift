//
//  FavoritesViewModel.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import Foundation

protocol FavoritesViewModelProtocol {
    
}

final class FavoritesViewModel: FavoritesViewModelProtocol {
    
    private let service: FavoritesServiceProtocol
    
    init(service: FavoritesServiceProtocol) {
        self.service = service
    }
    
}
