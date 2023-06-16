//
//  AppContainer.swift
//  musicViper
//
//  Created by Kenan Baylan on 31.05.2023.
//

import Foundation



let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = TopMusicService()
    
}
