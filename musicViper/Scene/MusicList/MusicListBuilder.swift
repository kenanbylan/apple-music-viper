//
//  MusicListBuilder.swift
//  musicViper
//
//  Created by Kenan Baylan on 31.05.2023.
//

import UIKit


final class MusicListBuilder {
    
    static func make() -> MusicListViewController {
        let storyboard = UIStoryboard(name: "MusicList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MusicListViewController") as! MusicListViewController
        
        viewController.service = app.service
        
        return viewController
    }
    
}
