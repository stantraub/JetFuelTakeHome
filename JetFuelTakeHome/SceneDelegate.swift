//
//  SceneDelegate.swift
//  JetFuelTakeHome
//
//  Created by Stanley Traub on 12/13/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let controller = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav = UINavigationController(rootViewController: controller)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

