//
//  ImageLoading.swift
//  CollectionHW
//
//  Created by Полина Рыфтина on 04.11.2022.
//

import UIKit

class ImageLoading {
    fileprivate lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    fileprivate var dataTask: URLSessionDataTask?

    fileprivate func loadImage(url: URL) {
        imageView.image = nil
        dataTask?.cancel()
        let urlRequest = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
        )
        dataTask = URLSession.shared
            .dataTask(with: urlRequest) { [imageView] data, _, _ in
                guard let data else {
                    print("could not load image")
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async { [imageView] in
                    guard let image else { return }
                    imageView.image = image
                    imageView.widthAnchor
                        .constraint(
                            equalTo: imageView.heightAnchor,
                            multiplier: image.size.width / image.size.height
                        )
                    .isActive = true
                }
            }
        dataTask?.resume()
    }
}
