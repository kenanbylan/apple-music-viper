//
//  TopMusicService.swift
//  musicViper
//  Created by Kenan Baylan on 30.05.2023.
//

import Foundation
import Alamofire

//Faydası servis için test yazılacak olursa faydası olur.

public protocol TopMusicServiceProtocol {
    func fetchTopMovies(completion: @escaping (Result<TopMusicResponse>) -> Void)
}


public class TopMusicService: TopMusicServiceProtocol {
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() { }
    
    
    
    public func fetchTopMovies(completion: @escaping (Result<TopMusicResponse>) -> Void) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/25/albums.json"
        
        AF.request(urlString).responseData { (response) in
            
            switch response.result {
                
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(TopMusicResponse.self, from: data)
                    completion(.success(response))

                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
                
                
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
            
        }
    }
}

