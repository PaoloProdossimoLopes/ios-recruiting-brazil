//
//  MovieDetailView.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

import UIKit

final class MovieDetailView: UIScrollView {
    
//    private var theMovieIsFavorite: Bool = false
//    
//    private var favoriteIconImage: UIImage? {
//        return theMovieIsFavorite ?
//        UIImage(named: IconsConstants.favoriteFullIcon) :
//        UIImage(named: IconsConstants.favoriteEmptyIcon)
//    }
    
    private(set) lazy var movieBannerImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: Constants.nonPhotoPlaceholder)
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
//    private(set) lazy var movieFavoriteIndicatorImageView: UIImageView = {
//        let tap = UITapGestureRecognizer(
//            target: self, action: #selector(favoriteIndicatorWasTapped)
//        )
//        let im = favoriteIconImage?.withTintColor(.darkYellowApp, renderingMode: .alwaysOriginal)
//        let iv = UIImageView()
//        iv.image = im
//        iv.contentMode = .scaleAspectFit
//        iv.backgroundColor = .clear
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.addGestureRecognizer(tap)
//        iv.isUserInteractionEnabled = true
//        return iv
//    }()
    
    private(set) lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Tca"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = .emptyText
        label.textColor = .black
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private lazy var movieInfoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: MovieDetailModel) {
        movieBannerImage.loadImageUsingCache(withUrl: model.movieImageURL)
        movieTitleLabel.text = model.movieTitle
        movieDescriptionLabel.text = model.movieOverview
    }
    
//    @objc private func favoriteIndicatorWasTapped() {
//        theMovieIsFavorite.toggle()
//        let im = favoriteIconImage?.withTintColor(.darkYellowApp)
//        movieFavoriteIndicatorImageView.image = im
//    }
}

//MARK: - ConfigureViewsProtocol
extension MovieDetailView: ConfigureViewsProtocol {
    func setupViewHierarcy() {
        addSubview(movieBannerImage)
//        addSubview(movieFavoriteIndicatorImageView)
        addSubview(movieInfoStackView)
        
        movieInfoStackView.addArrangedSubview(movieTitleLabel)
        movieInfoStackView.addArrangedSubview(movieDescriptionLabel)
    }
    
    func setupViewContraints() {
        NSLayoutConstraint.activate([
            movieBannerImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieBannerImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            movieBannerImage.widthAnchor.constraint(equalToConstant: 300),
            movieBannerImage.heightAnchor.constraint(lessThanOrEqualToConstant: 400),
            
            movieInfoStackView.topAnchor.constraint(equalTo: movieBannerImage.bottomAnchor, constant: 20),
            movieInfoStackView.centerXAnchor.constraint(equalTo: movieBannerImage.centerXAnchor),
            movieInfoStackView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width - 60),
        ])
    }
    
    func setupViewStyles() {
        backgroundColor = .yellowApp
    }
}
