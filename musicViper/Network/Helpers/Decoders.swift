//  Decoders.swift
//  viper-moviebox
//  Created by Kenan Baylan on 30.05.2023.



import Foundation

public enum Decoders {

//    2023-05-26
    static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
}




