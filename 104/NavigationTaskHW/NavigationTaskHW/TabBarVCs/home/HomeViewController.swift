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
    }
    
    @IBAction func animalImagesButtonDidTab(_ sender: Any) {
        guard let animalVC = storyboard?
            .instantiateViewController(withIdentifier: "AnimalViewController") else {return}
        animalVC.modalPresentationStyle = .fullScreen
        present(animalVC, animated: true)
    }
    
    @IBAction func browseCatalogButtonDidTab(_ sender: Any) {
        guard let browserCatalogVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "BrowserCatalogViewController")
        as? BrowserCatalogViewController else {return}
        navigationController?.pushViewController(browserCatalogVC, animated: true)
    }
    
    func editLabel() {
        let name: String = user ?? "noname"
        homeGrettingLabel.text = "Hello, \(name)!"
        homeGrettingLabel.font = .systemFont(ofSize: 20)
        homeGrettingLabel.textAlignment = .center
    }
    
}
