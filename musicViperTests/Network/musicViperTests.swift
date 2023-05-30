//
//  musicViperTests.swift
//  musicViperTests
//
//  Created by Kenan Baylan on 30.05.2023.
//

import XCTest

@testable import musicViper

final class musicViperTests: XCTestCase {
    
    func testExample() throws {
        
        let bundle = Bundle(for: musicViperTests.self)
        let url = bundle.url(forResource: "music", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let music = try decoder.decode(Music.self, from: data)
    
        XCTAssertEqual(music.artistName, "Lil Durk")
        XCTAssertEqual(music.name,"Almost Healed")
        XCTAssertEqual(music.genres.count,2)
        XCTAssertEqual(music.genres.first?.name,"Music")
        
    }
    
}
