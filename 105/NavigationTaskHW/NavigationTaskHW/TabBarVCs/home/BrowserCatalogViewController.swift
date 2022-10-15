//
//  BrowserCatalogViewController.swift
//  NavigationTaskHW
//
//  Created by Полина Рыфтина on 06.10.2022.
//

import UIKit

class BrowserCatalogViewController: UIViewController {
    var catalogNumber = 1
    
    @IBOutlet weak var browseCatalogButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Catalog \(catalogNumber)"
        setupConstraints()
    }
        
    @IBAction func browseCatalogTab(_ sender: UIButton) {
        guard let anotherVC: BrowserCatalogViewController = storyboard?
            .instantiateViewController(withIdentifier: "BrowserCatalogViewController")
                as? BrowserCatalogViewController else {return}
        anotherVC.catalogNumber = catalogNumber + 1
        navigationItem.title = "Catalog \(catalogNumber)"
        navigationController?.pushViewController(anotherVC, animated: true)
    }
    
    private func setupConstraints() {
        browseCatalogButtom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            browseCatalogButtom.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            browseCatalogButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            browseCatalogButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -120)
        ])
    }
}
