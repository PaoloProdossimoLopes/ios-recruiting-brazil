//
//  UIImageView+Extensions.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 16/04/22.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let placeholderImage = UIImage(named: Constants.nonPhotoPlaceholder)
        guard let url = URL(string: urlString) else {
            self.image = placeholderImage
            return
        }
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center

        // if not, download image from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                setupImage(placeholderImage)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    setupImage(image)
                } else {
                    setupImage(placeholderImage)
                }
            }
            
            func setupImage(_ image: UIImage?) {
                self.image = image
                activityIndicator.removeFromSuperview()
            }

        }).resume()
    }
}
