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
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(headerLabel)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        playlists = (0 ..< 10).map { _ in
            Playlist.randomPlaylist()
        }
        
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
                    style: .default,
                    reuseIdentifier: CellIdentifier.ordinary.rawValue
                )
            }
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
        var configuration = UIListContentConfiguration.cell()
        configuration.text = "True"
        configuration.textProperties.alignment = .center
        configuration.textProperties.color = .brown
        configuration.textProperties.font = .boldSystemFont(ofSize: 30)
        return configuration
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        } else {
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Favorites"
        } else {
            return "Playlists"
        }
    }
}
