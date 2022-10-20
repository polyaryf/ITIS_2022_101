//
//  DescriptionViewController.swift
//  CatalogHW
//
//  Created by Полина Рыфтина on 20.10.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private let titleLabel: UILabel = .init()
    private let tracksLabel: UILabel = .init()
    private let durationLabel: UILabel = .init()
  
    private func setup() {
        view.layer.backgroundColor = UIColor.white.cgColor
        titleLabel.text = playlist?.playlistTitle ?? ""
        titleLabel.font = .boldSystemFont(ofSize: 20)
        tracksLabel.text = "\(playlist?.numberOfTracks ?? 0) tracks"
        durationLabel.text = "Duration: \(playlist?.totalDuration ?? 0)"
        let labelsStackView = UIStackView(arrangedSubviews: [
            titleLabel, tracksLabel, durationLabel
        ])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 10
        labelsStackView.alignment = .center

        let allSongsStackView = UIStackView()
        allSongsStackView.spacing = 15
        allSongsStackView.axis = .vertical
        
        let songs = playlist?.allSongs ?? []
        for song in songs {
            let songStackView = UIStackView()
            songStackView.spacing = 5
            songStackView.axis = .vertical
            let titleSongLabel = UILabel()
            let authorSongLabel = UILabel()
            titleSongLabel.text = "\(song.songTitle)"
            authorSongLabel.text = "\(song.author)"
            titleSongLabel.font = .systemFont(ofSize: 16)
            authorSongLabel.font = .systemFont(ofSize: 12)
            songStackView.addArrangedSubview(titleSongLabel)
            songStackView.addArrangedSubview(authorSongLabel)
            songStackView.alignment = .center
            songStackView.layer.cornerRadius = 20
            songStackView.layer.borderWidth = 0.5
            songStackView.layer.borderColor = UIColor.gray.cgColor
            allSongsStackView.addArrangedSubview(songStackView)
        }
        
        let stackView = UIStackView(arrangedSubviews: [
            labelsStackView, allSongsStackView
        ])
        stackView.spacing = 20
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        ])
        
    }
}
