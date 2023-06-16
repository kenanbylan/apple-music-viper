//
//  MusicListBuilder.swift
//  musicViper
//
//  Created by Kenan Baylan on 2.06.2023.
//

import Foundation
import UIKit


//MARK: Music List sayfasını oluşturacak component.
final class MusicListBuilder {
    
    static func make() -> MusicListViewController {
        let storyboard = UIStoryboard(name: "MusicList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MusicListViewController") as! MusicListViewController
        
        
        
        //viewController.viewModel = MusicListViewModel(service: app.service)
        
        return viewController
    }
    
    
}
