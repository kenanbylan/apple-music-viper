//
//  AppRouter.swift
//  musicViper
//
//  Created by Kenan Baylan on 31.05.2023.
//

import UIKit


final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        viewController.title = "Replace me"
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
