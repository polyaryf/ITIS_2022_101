//
//  TableViewController.swift
//  CatalogHW
//
//  Created by Полина Рыфтина on 18.10.2022.
//

import UIKit

class TableViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private let tableView: UITableView = .init()
    private let headerLabel: UILabel = .init()
    private var playlists: [Playlist] = []
    private var favouriteSongs: [Song] = []
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(headerLabel)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
                tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        playlists = (0 ..< 13).map { _ in
            Playlist.randomPlaylist()
        }
        tableView.separatorStyle = .none
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CellIdentifier.custom.rawValue
        )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        setupLabel()
    }
    
    private func setupLabel() {
        headerLabel.text = "Music catalog"
        headerLabel.font = .boldSystemFont(ofSize: 40)
        headerLabel.textAlignment = .left
        headerLabel.textColor = .black
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if section == 0 {
            return 5
        } else {
            return playlists.count
        }
    }
    
    enum CellIdentifier: String {
        case ordinary
        case custom
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.section == 0 {
            if let dequeaedCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.ordinary.rawValue) {
                cell = dequeaedCell
            } else {
                cell = UITableViewCell(
                    style: .value2,
                    reuseIdentifier: CellIdentifier.ordinary.rawValue
                )
            }
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.layer.cornerRadius = 40
            cell.backgroundColor = .white
            cell.contentConfiguration = config()
            return cell
        } else {
            guard let customCell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifier.custom.rawValue, for: indexPath
            ) as? CustomTableViewCell
            else {
                fatalError("Could not deque cell of type \(CustomTableViewCell.self)")
            }
            let playlist = playlists[indexPath.row]
            customCell.set(playlist: playlist)
            return customCell
        }
    }
    
    private func config() -> UIListContentConfiguration {
        let song = Playlist.randomSong()
        var cellConfiguration = UIListContentConfiguration.cell()
        cellConfiguration.image = UIImage(named: song.songTitle)
        cellConfiguration.text = song.songTitle
        cellConfiguration.secondaryText = song.author
        cellConfiguration.textProperties.color = .black
        cellConfiguration.textProperties.font = .boldSystemFont(ofSize: 18)
        return cellConfiguration
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        } else {
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        } else {
            return 140
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "You recently listened to"
        } else {
            return "Playlists"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let descriptionVC = DescriptionViewController()
        descriptionVC.playlist = playlists[indexPath.row]
        present(descriptionVC, animated: true)
    }
}
