//
//  MusicListPresentation.swift
//  musicViper
//
//  Created by Kenan Baylan on 2.06.2023.
//

import Foundation


struct MusicPresentation {
    
    let title: String
    let detail:String
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
    

}


extension MusicPresentation {
    
    init(music: Music) {
        self.init(title: music.name, detail: music.artistName)
    }
}
