//
//  TopMusicService.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.
//

import Foundation
import Alamofire

//faydası servis için test yazılacak olursa faydası olur.
protocol TopMusicServiceProtocol {
    func fetchTopMovies(completion: @escaping (Result<TopMusicResponse>) -> Void)
}


class TopMusicService: TopMusicServiceProtocol {
    
    enum Error: Swift.Error {
        case serializationError(internal:Swift.Error)
        case networkError(internal:Swift.Error)
    }
    
    public init() { }
    
    
    func fetchTopMovies(completion: @escaping (Result<TopMusicResponse>) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/25/albums.json"
        
        AF.request(urlString).responseData { (response) in
            
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(TopMusicResponse.self, from: data)
                    completion(.succes(response))
                } catch {
                    completion(.error(Error.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.error(Error.networkError(internal: error)))
            }
    
        }
    }
}

