//
//  MockTopMusicService.swift
//  musicViper
//
//  Created by Kenan Baylan on 2.06.2023.
//

import Foundation


final class MockTopMusicService: TopMusicServiceProtocol {
    
    var musics: [Music] = []
    
    func fetchTopMusic(completion: @escaping (Result<TopMusicResponse>) -> Void) {
        completion(.success(TopMusicResponse(results: musics)))
    }
    
    
    
}
