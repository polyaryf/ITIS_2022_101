//
//  CustomTableViewCell.swift
//  CatalogHW
//
//  Created by Полина Рыфтина on 19.10.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private let titleLabel: UILabel = .init()
    private let numberOfTracksLabel: UILabel = .init()
    private let totalDurationLabel: UILabel = .init()
    private let isDownloadedImage: UIImageView = .init()
    private let coverImageView: UIImageView = .init()

    func set(playlist: Playlist) {
        titleLabel.text = playlist.playlistTitle
        numberOfTracksLabel.text = "\(playlist.numberOfTracks) tracks"
        totalDurationLabel.text = "Duration: \(playlist.totalDuration)"
        isDownloadedImage.tintColor = .gray
        if playlist.isDownloaded {
            isDownloadedImage.image = UIImage(systemName: "square.and.arrow.down.fill")
        } else {
            isDownloadedImage.image = UIImage(systemName: "square.and.arrow.down")
        }
        coverImageView.image = UIImage(named: "title\(Int.random(in: 1...11))")
    }
    
    private func setup() {
        titleLabel.font = .systemFont(ofSize: 20)
        numberOfTracksLabel.font = .systemFont(ofSize: 12)
        totalDurationLabel.font = .systemFont(ofSize: 12)
        let labelsStackView = UIStackView(
            arrangedSubviews: [ titleLabel, numberOfTracksLabel, totalDurationLabel]
        )
        labelsStackView.spacing = 5
        labelsStackView.axis = .vertical
        
        let stackView = UIStackView(
            arrangedSubviews: [ coverImageView, labelsStackView, isDownloadedImage]
        )
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            coverImageView.widthAnchor.constraint(equalToConstant: 100),
            coverImageView.heightAnchor.constraint(equalToConstant: 100),
            isDownloadedImage.widthAnchor.constraint(equalToConstant: 25),
            isDownloadedImage.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
