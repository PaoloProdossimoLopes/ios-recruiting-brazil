//
//  FavoritesViewController.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    let contentView: FavoritesView
    private let viewModel: FavoritesViewModelProtocol
    
    init(_ contentView: FavoritesView, viewModel: FavoritesViewModelProtocol) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    private func setup() {
        configureNavigationBar()
        configureTabBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Favorites"
    }
    
    private func configureTabBar() {
        let image = UIImage(named: "favorite_empty_icon")
        tabBarItem = .init(title: "Favorites", image: image, tag: 0)
    }
}
