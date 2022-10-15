//
//  AnimalViewController.swift
//  NavigationTaskHW
//
//  Created by Полина Рыфтина on 06.10.2022.
//

import UIKit

class AnimalViewController: UIViewController {
    @IBOutlet private var animalImage: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalImage.image = UIImage(named: "cat")
        setupConstraints()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        animalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            animalImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animalImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animalImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            animalImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30)
        ])
    }
}
