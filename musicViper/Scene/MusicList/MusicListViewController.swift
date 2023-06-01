//
//  MusicListViewController.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.
//

import Foundation
import UIKit


final class MusicListViewController: UIViewController {
    
    @IBOutlet var customView: MusicListView! 
    
    
    var service: TopMusicServiceProtocol = TopMusicService()
    private var musicList: [Music] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Musics"
        
        customView.setLoading(true)
        
        service.fetchTopMovies { [weak self] result in
            
            guard let `self` = self else { return }
            
            switch result {
            case .success(let value):
                self.musicList = value.results
                let musicPresentations = value.results.map(MusicPresentation.init)
                print("musicPresentations: ", musicPresentations)
                self.customView.updateMusicList(musicPresentations)
                
            case .failure(let error):
                print("Error:" ,error)
            }
            
            self.customView.setLoading(false)
        }
    }
}


extension MusicListViewController: MusicListViewDelegate {
    func didSelectMusic(at index: Int) {
        let music = musicList[index]
        
        
    }
}
