//
//  MusicListViewModel.swift
//  musicViper
//
//  Created by Kenan Baylan on 2.06.2023.
//

import Foundation


final class MusicListViewModel: MusicListViewModelProtocol {
    
    var delegate: MusicListViewModelDelegate?
    private let service: TopMusicServiceProtocol
    private var musics: [Music] = []
    
    
    init(service:TopMusicServiceProtocol) {
        self.service = service
    }
    
    
    func load() {
        print("Loada girildi..")
        notify(.updateTitle("Music"))
        notify(.setLoading(true))
        
        service.fetchTopMovies { [weak self] result in
            guard let self = self else { return }
            
            self.notify(.setLoading(false))
            
            switch result {
            case .success(let response):
                self.musics = response.results
                let presentation = response.results.map({ MusicPresentation(music: $0) })
                
                self.notify(.showMusicList(presentation))
            
            case .failure(let error):
                print("Error: ", error)
            }
            
        }
    }
    
    
    func selectMusic(at index: Int) {
        //todo
    }
    
    
    private func notify(_ output: MusicListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
}
