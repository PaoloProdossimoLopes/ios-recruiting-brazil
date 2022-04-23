//
//  MovieViewController.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

final class MovieViewController: UIViewController {
    
    //MARK: - Properties
    private let contentView: MovieView
    private var viewModel: MovieViewModelProtocol
    
    //MARK: - Constructor
    init(_ contetView: MovieView, viewModel: MovieViewModelProtocol) {
        self.contentView = contetView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovies()
    }
    
    //MARK: - Helpers
    private func setup() {
        configureNavigationBar()
        configureTabBar()
        configureBinding()
        setupDelegates()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = Constants.movieViewControllerTitle
    }
    
    private func configureTabBar() {
        let image = UIImage(named: IconsConstants.listIcon)
        tabBarItem = .init(title: Constants.movieViewControllerTitle, image: image, tag: 0)
    }
    
    private func configureBinding() {
        contentView.actions = .init(
            numberOfRowsInSection: { () -> Int in
                return self.viewModel.movieModels.count
            },
            cellForRowIndexPath: {  row -> MovieModel in
                return self.viewModel.movieModels[row]
            }
        )
    }
    
    private func setupDelegates() {
        viewModel.controllerDelegate = self
        contentView.delegate = self
    }
}

//MARK: - MovieViewModelToController
extension MovieViewController: MovieViewModelToController {
    func updateController() {
        contentView.movieCollectionView.reloadData()
    }
}

//MARK: - MovieViewDelegate
extension MovieViewController: MovieViewDelegate {
    func didSelectMovie(at index: Int) {
        let movieId = viewModel.movieModels[index]
        viewModel.didSelectViewToShowDetail(id: movieId.id)
    }
    
    func searchTextChangeText(_ text: String) {
        viewModel.filterListOfMovies(text)
    }
}
