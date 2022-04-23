//
//  MovieView.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 15/04/22.
//

import UIKit

protocol MovieViewDelegate: AnyObject {
    func searchTextChangeText(_ text: String)
    func didSelectMovie(at index: Int)
}

final class MovieView: UIView {
    
    struct Actions {
        var numberOfRowsInSection: (() -> Int)?
        var cellForRowIndexPath: ((Int) -> MovieModel)?
    }
    
    var actions: Actions?
    weak var delegate: MovieViewDelegate?
    
    private(set) lazy var movieSearchBar: UISearchBar = {
        let placeholder = Constants.searchPlaceholderText
        let placeholderAtributed = [
            NSAttributedString.Key.foregroundColor : UIColor.darkYellowApp
        ]
        let image = UIImage(named: IconsConstants.searchIcon)?
            .withTintColor(.darkYellowApp, renderingMode: .alwaysOriginal)
        let imageView = UIImageView.init(image: image)
        let sb = UISearchBar()
        sb.placeholder = placeholder
        sb.searchTextField.attributedPlaceholder = .init(string: placeholder, attributes: placeholderAtributed)
        sb.searchTextField.leftView = imageView
        sb.searchTextField.leftView?.contentMode = .scaleAspectFit
        sb.searchTextField.leftView?.translatesAutoresizingMaskIntoConstraints = false
        sb.searchTextField.leftView?.heightAnchor.constraint(equalToConstant: Constants.searchIconHeight).isActive = true
        sb.searchTextField.leftViewMode = .always
        sb.backgroundColor = .clear
        sb.tintColor = .black
        sb.searchTextField.textColor = .black
        sb.searchTextField.backgroundColor = .darkYellowApp.withAlphaComponent(Constants.searchTextFieldBackgorundOpacity)
        sb.backgroundImage = UIImage()
        sb.searchTextField.clearButtonMode = .never
        sb.delegate = self
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    private(set) lazy var movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let screenWidth = UIScreen.main.bounds.width
        let collectionMarginSize: CGFloat = 2 * 16
        let numberOfColuns: CGFloat = 2
        let spacingBetweenCells: CGFloat = 5
        let cellWidth = ((screenWidth - collectionMarginSize) / numberOfColuns) - spacingBetweenCells
        let cellHeight = cellWidth * 1.5
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ConfigureViews
extension MovieView: ConfigureViewsProtocol {
    func setupViewHierarcy() {
        addSubview(movieSearchBar)
        addSubview(movieCollectionView)
    }
    
    func setupViewContraints() {
        movieSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        movieSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.movieViewMargins).isActive = true
        movieSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.movieViewMargins).isActive = true
        
        movieCollectionView.topAnchor.constraint(equalTo: movieSearchBar.bottomAnchor).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.movieViewMargins).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.movieViewMargins).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupViewStyles() {
        backgroundColor = .yellowApp
    }
}

//MARK: - Delegate & DataSource
extension MovieView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions?.numberOfRowsInSection?() ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath
        ) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        let movieModel = actions?.cellForRowIndexPath?(indexPath.item)
        cell.setup(model: movieModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectMovie(at: indexPath.item)
    }
}

//MARK: - UISearchBarDelegate
extension MovieView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchTextChangeText(searchText)
    }
}
