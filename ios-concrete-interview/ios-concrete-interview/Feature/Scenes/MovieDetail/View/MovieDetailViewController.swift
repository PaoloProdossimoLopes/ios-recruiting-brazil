//
//  MovieDetailViewController.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private var viewModel: MovieDetailViewModelProtocol
    private var contentView: MovieDetailView
    
    //MARK: - Constructor
    
    init(contentView: MovieDetailView, viewModel: MovieDetailViewModelProtocol) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        start()
    }
    
    //MARK: - Helper
    
    private func configureNavigation() {
        navigationItem.title = Constants.movieViewControllerTitle
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func start() {
        viewModel.fetchMovieDetails()
        viewModel.controllerDelegate = self
    }
}

//MARK: - MovieDetailViewModelToController
extension MovieDetailViewController: MovieDetailViewModelToController {
    func updateView(_ model: MovieDetailModel?) {
        guard let model = model else { return }
        contentView.update(model: model)
    }
}
