//
//  HappyCatCollectionViewCell.swift
//  CollectionHW
//
//  Created by Полина Рыфтина on 04.11.2022.
//

import UIKit

class HappyCatCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 30
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    func set(imageUrl: URL) {
        loadImage(url: imageUrl)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setup()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
        setConstraint()
    }
    
    private func setup() {
        contentView.addSubview(imageView)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    private var dataTask: URLSessionDataTask?

    private func loadImage(url: URL) {
        imageView.image = nil
        dataTask?.cancel()
        let urlRequest = URLRequest(
            url: url,
            cachePolicy: .returnCacheDataElseLoad
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
                }
            }
        dataTask?.resume()
    }
}
