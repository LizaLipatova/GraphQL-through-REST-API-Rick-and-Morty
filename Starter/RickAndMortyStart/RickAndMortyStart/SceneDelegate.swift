//
//  SceneDelegate.swift
//  RickAndMortyStart
//
//  Created by Yelyzaveta Lipatova on 09.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let charactersListViewController = CharactersListViewController()
            charactersListViewController.viewModel = CharactersListViewModel()
            
            let navigationController = UINavigationController(rootViewController: charactersListViewController)
            window.rootViewController = navigationController

            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

