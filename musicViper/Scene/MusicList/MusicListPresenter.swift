//  MusicListPresenter.swift
//  musicViper
//  Created by Kenan Baylan on 14.06.2023.


import Foundation


class MusicListPresenter: MusicListPresenterProtocol {
    
    private let view: MusicListViewProtocol // for view
    private let interactor: MusicListInteractorProtocol //for interactor
    
    
    init(view: MusicListViewProtocol, interactor: MusicListInteractorProtocol){
        self.view = view
        self.interactor = interactor
    }
    
    
    func load() {
        // update title
        view.handleOutput(.updateTitle("Musics"))
        
        //load musics
        interactor.load()
        
    }
    
    func selectMusic(at index: Int) {
        interactor.selectMusic(at: index)
    }
    
    
    
    
}
