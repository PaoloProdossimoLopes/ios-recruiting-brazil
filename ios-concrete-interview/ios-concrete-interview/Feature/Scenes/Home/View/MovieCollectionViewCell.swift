//
//  MovieCollectionViewCell.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell, Reusable {
    
    private(set) var isVaforite: Bool = false
    
    private(set) lazy var favoriteIconIndicator: UIImageView = {
        let tap = UITapGestureRecognizer(
            target: self, action: #selector(favoriteHandleTapped)
        )
        let image = UIImage(named: IconsConstants.favoriteEmptyIcon)?
            .withTintColor(.yellowApp, renderingMode: .alwaysOriginal)
        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addGestureRecognizer(tap)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private(set) lazy var nameOfMovieLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellowApp
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var movieBannerImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var nameOfMovieContent: UIView = {
        let view = UIView()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.frame
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurView)
        view.sendSubviewToBack(blurView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(model: MovieModel?) {
        guard let model = model else { return }
        movieBannerImageView.loadImageUsingCache(withUrl: model.mobieBanner)
        nameOfMovieLabel.text = model.movieName
        isVaforite = false
        updateHeartState()
    }
    
    func updateHeartState() {
        let imageName = isVaforite ?
        IconsConstants.favoriteFullIcon :
        IconsConstants.favoriteEmptyIcon
        favoriteIconIndicator.image = UIImage(named: imageName)?
            .withTintColor(.yellowApp, renderingMode: .alwaysOriginal)
    }
    
    @objc private func favoriteHandleTapped() {
        isVaforite.toggle()
        updateHeartState()
    }
}

//MARK: - ConfigureViewsProtocol
extension MovieCollectionViewCell: ConfigureViewsProtocol {
    func setupViewHierarcy() {
        addSubview(movieBannerImageView)
        addSubview(nameOfMovieContent)
        addSubview(favoriteIconIndicator)
        nameOfMovieContent.addSubview(nameOfMovieLabel)
    }
    
    func setupViewContraints() {
        movieBannerImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieBannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieBannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        movieBannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        favoriteIconIndicator.topAnchor.constraint(equalTo: topAnchor, constant: Constants.heartIconMargin).isActive = true
        favoriteIconIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.heartIconMargin).isActive = true
        favoriteIconIndicator.widthAnchor.constraint(equalToConstant: Constants.headtIconSize).isActive = true
        favoriteIconIndicator.heightAnchor.constraint(equalToConstant: Constants.headtIconSize).isActive = true
        
        nameOfMovieContent.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameOfMovieContent.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameOfMovieContent.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameOfMovieContent.heightAnchor.constraint(equalToConstant: Constants.nameOfMovieContentHeight).isActive = true
        
        nameOfMovieLabel.topAnchor.constraint(equalTo: nameOfMovieContent.topAnchor, constant: Constants.nameOfMovieLabelMarigin).isActive = true
        nameOfMovieLabel.leadingAnchor.constraint(equalTo: nameOfMovieContent.leadingAnchor, constant: Constants.nameOfMovieLabelMarigin).isActive = true
        nameOfMovieLabel.trailingAnchor.constraint(equalTo: nameOfMovieContent.trailingAnchor, constant: -Constants.nameOfMovieLabelMarigin).isActive = true
        nameOfMovieLabel.bottomAnchor.constraint(equalTo: nameOfMovieContent.bottomAnchor, constant: -Constants.nameOfMovieLabelMarigin).isActive = true
    }
    
    func setupViewStyles() {
        backgroundColor = .white
        layer.cornerRadius = 8
        contentView.isHidden = true
        clipsToBounds = true
    }
}
