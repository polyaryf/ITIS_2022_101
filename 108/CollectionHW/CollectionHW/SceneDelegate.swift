//
//  SceneDelegate.swift
//  CollectionHW
//
//  Created by Полина Рыфтина on 02.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        self.window = window
        window.rootViewController = CompositionalLayoutController()
        window.makeKeyAndVisible()
    }
}

