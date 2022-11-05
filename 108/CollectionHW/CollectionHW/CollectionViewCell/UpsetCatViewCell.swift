//
//  UpsetCatViewCell.swift
//  CollectionHW
//
//  Created by Полина Рыфтина on 03.11.2022.
//

import UIKit

class UpsetCatViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var textLabel: UILabel = {
        let text = UILabel()
        text.font = .boldSystemFont(ofSize: 20)
        text.backgroundColor = .lightGray
        text.textColor = .darkGray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    func set(text: String, imageUrl: URL) {
        textLabel.text = text
        loadImage(url: imageUrl)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(imageView)
        contentView.contentMode = .bottomLeft
        imageView.addSubview(textLabel)
        setConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -12),
            textLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 12)
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

    
 

