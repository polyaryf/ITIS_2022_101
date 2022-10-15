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
        setupConstraints()
    }
    
    @IBAction func signOutButtonTab(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
//        guard let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") else {return}
//        welcomeVC.modalPresentationStyle = .fullScreen
//        present(welcomeVC, animated: true)
    }
    
    private func editLabel() {
        let name: String = user ?? "noname"
        exitGreetingLabel.text = "Hello, \(name)!"
        exitGreetingLabel.font = .systemFont(ofSize: 20)
        exitGreetingLabel.textAlignment = .center
    }
    
    private func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: [exitGreetingLabel, signOutButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 50
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 206),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -140)
        ])
    }
}
