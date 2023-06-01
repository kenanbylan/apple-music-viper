//
//  AppDelegate.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        app.router.start()

        return true
    }


}

