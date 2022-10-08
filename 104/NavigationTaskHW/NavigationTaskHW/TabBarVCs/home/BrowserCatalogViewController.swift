//
//  BrowserCatalogViewController.swift
//  NavigationTaskHW
//
//  Created by Полина Рыфтина on 06.10.2022.
//

import UIKit

class BrowserCatalogViewController: UIViewController {
    var catalogNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Catalog \(catalogNumber)"
    }
        
    @IBAction func browseCatalogDidTab(_ sender: UIButton) {
        guard let anotherVC: BrowserCatalogViewController = storyboard?
            .instantiateViewController(withIdentifier: "BrowserCatalogViewController")
                as? BrowserCatalogViewController else {return}
        anotherVC.catalogNumber = catalogNumber + 1
        navigationItem.title = "Catalog \(catalogNumber)"
        navigationController?.pushViewController(anotherVC, animated: true)
    }
}
