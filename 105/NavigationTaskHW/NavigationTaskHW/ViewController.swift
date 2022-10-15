//
//  ViewController.swift
//  NavigationTaskHW
//
//  Created by Полина Рыфтина on 05.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var signInButton: UIButton!
    @IBOutlet private var greetingLabel: UILabel!
    
    let appUser: User = User(username: "Polya", password: "qwerty")
    
    override func viewWillAppear(_ animated: Bool) {
             usernameTextField.text = ""
             passwordTextField.text = ""
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLabel()
        setupConstraints()
    }
    
    @IBAction func signInTab(_ sender: Any) {
        guard usernameTextField.text == appUser.username
                && passwordTextField.text == appUser.password
        else {
            createAlert()
            return
        }
        guard let tabbarVC = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController")
                        as? UITabBarController else {return}
        guard let viewControllers = tabbarVC.viewControllers else { return }
        guard let homeNC = viewControllers.first as? UINavigationController else {return}
        guard let homeVC = homeNC.viewControllers.first as? HomeViewController else {return}
        homeVC.user = usernameTextField.text
        guard let exitNC = viewControllers.last as? UINavigationController else {return}
        guard let exitVC = exitNC.viewControllers.first as? ExitViewController else {return}
        exitVC.user = usernameTextField.text
        tabbarVC.modalPresentationStyle = .fullScreen
        present(tabbarVC, animated: true)
    }
        
    private func editLabel() {
        greetingLabel.text = "Welcome"
        greetingLabel.font = .systemFont(ofSize: 20)
        greetingLabel.textAlignment = .center
    }
    
    private func createAlert(){
        let alert = UIAlertController(title: "", message: "Wrong username or password", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    private func setupConstraints(){
        let stackView = UIStackView(arrangedSubviews: [greetingLabel, usernameTextField, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            stackView.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            signInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 17)
        ])
    }
}
