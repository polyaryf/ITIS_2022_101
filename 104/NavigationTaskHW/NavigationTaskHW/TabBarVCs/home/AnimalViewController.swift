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
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
