//  MusicListInteractor.swift
//  musicViper
//  Created by Kenan Baylan on 14.06.2023.


import Foundation


//Interactor model ve service ile bağlantı kurarak verileri çeker.

class MusicListInteractor: MusicListInteractorProtocol {
    
    var delegate: MusicListInteractorDelegate?
    
    private var service: TopMusicServiceProtocol
    private var musics: [Music] = []
    
    init(service: TopMusicServiceProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        
        service.fetchTopMusic { [weak self] result in
            guard let self = self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            
            switch result {
            case .success(let value):
                self.musics = value.results
                self.delegate?.handleOutput(.showMusicList(value.results))
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
    func selectMusic(at index: Int) {
        let music = musics[index]
        delegate?.handleOutput(.showMusicDetail(music))
    }
    
}
