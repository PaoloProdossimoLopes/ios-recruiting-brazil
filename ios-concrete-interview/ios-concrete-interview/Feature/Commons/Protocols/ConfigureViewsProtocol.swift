//
//  ConfigureViews.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

protocol ConfigureViewsProtocol {
    func setupViewHierarcy()
    func setupViewContraints()
    func setupViewStyles()
    func commonInit()
}

extension ConfigureViewsProtocol {
    func commonInit() {
        setupViewHierarcy()
        setupViewStyles()
        setupViewContraints()
    }
    
    func setupViewStyles() { }
}
