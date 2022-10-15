//
//  HomeViewController.swift
//  NavigationTaskHW
//
//  Created by Полина Рыфтина on 05.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private var homeGrettingLabel: UILabel!
    @IBOutlet private var browseCatalogButton: UIButton!
    @IBOutlet private var animalImagesButton: UIButton!
    
    var user: String?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLabel()
        setupConstraints()
    }
    
    @IBAction func animalImagesButtonTab(_ sender: Any) {
        guard let animalVC = storyboard?
            .instantiateViewController(withIdentifier: "AnimalViewController") else {return}
        animalVC.modalPresentationStyle = .fullScreen
        present(animalVC, animated: true)
    }
    
    @IBAction func browseCatalogButtonTab(_ sender: Any) {
        guard let browserCatalogVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "BrowserCatalogViewController")
        as? BrowserCatalogViewController else {return}
        navigationController?.pushViewController(browserCatalogVC, animated: true)
    }
    
    private func editLabel() {
        let name: String = user ?? "noname"
        homeGrettingLabel.text = "Hello, \(name)!"
        homeGrettingLabel.font = .systemFont(ofSize: 20)
        homeGrettingLabel.textAlignment = .center
    }
    
    private func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: [browseCatalogButton, animalImagesButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 35
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -180),
            stackView.topAnchor.constraint(equalTo: homeGrettingLabel.bottomAnchor, constant: 50),
            homeGrettingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            homeGrettingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
    }
}
