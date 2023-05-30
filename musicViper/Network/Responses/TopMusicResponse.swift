//
//  TopMusicResponse.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.
//

import Foundation

public struct TopMusicResponse: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case feed
    }
    
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
    let results: [Music]
    
    public init(from decoder: Decoder) throws  {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Music].self, forKey: .results)
    }
 
  
}
