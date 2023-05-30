//
//  ViewController.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.
//

import UIKit

class ViewController: UIViewController {

    
    let service: TopMusicServiceProtocol = TopMusicService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        service.fetchTopMovies { (result) in
            print(result)
        }
    }


}

