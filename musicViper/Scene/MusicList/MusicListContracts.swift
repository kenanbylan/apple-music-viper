//
//  MusicListContracts.swift
//  musicViper
//
//  Created by Kenan Baylan on 2.06.2023.
//

import Foundation

//viewdan viewmodele göndermemiz gereken neler bunu modelliyoruz.
protocol MusicListViewModelProtocol {
    var delegate: MusicListViewModelDelegate? { get set }
    func load()
    func selectMusic(at index: Int)
    
}


enum MusicListViewModelOutput: Equatable {
    
    static func == (lhs: MusicListViewModelOutput, rhs: MusicListViewModelOutput) -> Bool {
        return true
    }
    
    case updateTitle(String)
    case setLoading(Bool)
    case showMusicList([MusicPresentation])
}


protocol MusicListViewModelDelegate {
    func handleViewModelOutput(_ output: MusicListViewModelOutput)
}
