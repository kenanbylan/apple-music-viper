//  MusicListContracts.swift
//  musicViper
//  Created by Kenan Baylan on 14.06.2023


import Foundation


//MARK: - Interactor   -Interactor neden ekledik

protocol MusicListInteractorProtocol {
    
    var delegate: MusicListInteractorDelegate? { get set }
    func load()
    func selectMusic(at index: Int)
}


enum MusicListInteractorOutput {
    case setLoading(Bool)
    case showMusicList([Music])
    case showMusicDetail(Music)
}


protocol MusicListInteractorDelegate {
    func handleOutput(_ output: MusicListInteractorOutput)
}


//MARK: -Presenter
protocol MusicListPresenterProtocol {
    func load()
    func selectMusic(at index: Int)
}


enum MusicListPresenterOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showMusicList([MusicPresentation])
}



//MARK: -View   -Note: View tarafında bu fonksiyon implement edilecek.
protocol MusicListViewProtocol {
    func handleOutput(_ output: MusicListPresenterOutput)
}




//MARK: -Router
enum MusicListRoute {
    case detail(Music)
}

protocol MusicListRouterProtocol {
    func navigate(to route: MusicListRoute)
}
