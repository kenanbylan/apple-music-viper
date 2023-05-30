//
//  Music.swift
//  viper-moviebox
//
//  Created by Kenan Baylan on 30.05.2023.
//

import Foundation



//Decodable : json to object
public struct Music: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case artistName
        case releaseDate
        case name
        case image = "artworkUrl100"
        case genres
    }
    
    public let artistName: String
    public let releaseDate: Date
    public let name: String
    public let image: URL
    public let genres: [Genre] //index 1
    
}

public struct Genre: Decodable {
    public let name:String
}
