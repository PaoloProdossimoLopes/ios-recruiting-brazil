//
//  FavoritesView.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

final class FavoritesView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ConfigureViewsProtocol
extension FavoritesView: ConfigureViewsProtocol {
    func setupViewHierarcy() {
        
    }
    
    func setupViewContraints() {
        
    }
    
    func setupViewStyles() {
        backgroundColor = .yellowApp
    }
}
