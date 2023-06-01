//
//  MusicListContracts.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.
//

import Foundation



protocol MusicListViewProtocol {
    var delegate: MusicListViewDelegate? { get set }
    func updateMusicList(_ musicList: [MusicPresentation])
    func setLoading(_ isLoading: Bool)
}

protocol MusicListViewDelegate {
    func didSelectMusic(at index: Int)
}
