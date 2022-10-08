//
//  ExistViewController.swift
//  NavigationTaskHW
//
//  Created by Полина Рыфтина on 05.10.2022.
//

import UIKit

class ExitViewController: UIViewController {
    @IBOutlet private var signOutButton: UIButton!
    @IBOutlet private var exitGreetingLabel: UILabel!
    
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLabel()
    }
    
    @IBAction func signOutButtonDidTab(_ sender: Any) {
        guard let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") else {return}
        welcomeVC.modalPresentationStyle = .fullScreen
        present(welcomeVC, animated: true)
    }
    
    func editLabel() {
        let name: String = user ?? "noname"
        exitGreetingLabel.text = "Hello, \(name)!"
        exitGreetingLabel.font = .systemFont(ofSize: 20)
        exitGreetingLabel.textAlignment = .center
        
    }
}
