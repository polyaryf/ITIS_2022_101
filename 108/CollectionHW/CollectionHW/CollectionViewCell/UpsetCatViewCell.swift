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
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var loadingTask: Task<Void, Never>?
    
    func set(image: CompositionalLayoutController.UpsetCatImage) {
        loadingTask?.cancel()
        loadingTask = Task {
            await loadImage(url: image.url)
        }
        textLabel.text = image.name
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        
        setConstraint()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
        setupDefaultRatio()
    }
    
    private var aspectRatioConstraint: NSLayoutConstraint?
    
    private func setupDefaultRatio() {
        aspectRatioConstraint?.isActive = false
        aspectRatioConstraint = imageView.widthAnchor.constraint(
            equalTo: imageView.heightAnchor, multiplier: 1
        )
        aspectRatioConstraint?.isActive = true
    }
    
    private func setupRatio(for image: UIImage) {
        aspectRatioConstraint?.isActive = false
        aspectRatioConstraint = imageView
            .widthAnchor.constraint(
                    equalTo: imageView.heightAnchor,
                    multiplier:  image.size.width / image.size.height
            )
        aspectRatioConstraint?.isActive = true
    }
    
    @MainActor
    private func loadImage(url: URL) async{
        setupDefaultRatio()
        
        imageView.image = nil
        let urlRequest = URLRequest(
            url: url,
            cachePolicy: .returnCacheDataElseLoad
        )
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            guard !Task.isCancelled else { return }
            guard let image = UIImage(data: data) else { return }
            imageView.image = image
            setupRatio(for: image)
        } catch {
            print("could not load image")
        }
    }
}
