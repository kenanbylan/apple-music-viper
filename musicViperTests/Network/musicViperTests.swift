//
//  musicViperTests.swift
//  musicViperTests
//
//  Created by Kenan Baylan on 30.05.2023.
//

import XCTest

@testable import musicViper

final class musicViperTests: XCTestCase {
    
    private var viewModel: MusicListViewModel!
    private var view: MockView!
    private var service: MockTopMusicService!
    
    
    override  func setUp() {
        service = MockTopMusicService()
        viewModel = MusicListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
        
    }
    
    
    func testLoad() throws {
        // Given:
        let music1 = try ResourceLoader.loadMusic(resource: .music1)
        let music2 = try ResourceLoader.loadMusic(resource: .music2)
        service.musics = [music1,music2]
    
        //When:
        viewModel.load()
        
        XCTAssertEqual(try view.outputs.count, 4)
        
        
        //Then:
        switch  try view.outputs.element(at: 0) {
        case .updateTitle(_):
            break //Success!
            
        default:
            XCTFail("Fist output should be 'updateTitle'. ")
        }
        
        XCTAssertEqual(try view.outputs.element(at: 1) , .setLoading(true))
        XCTAssertEqual(try view.outputs.element(at: 2) , .setLoading(false))
        
        let expectedMusic = [music1,music2].map({ MusicPresentation(music: $0)})
        XCTAssertEqual(try view.outputs.element(at: 2) , .showMusicList(expectedMusic))
        
    }
    
}


private class MockView: MusicListViewModelDelegate {
    
    var outputs: [MusicListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: musicViper.MusicListViewModelOutput) {
        outputs.append(output)
    }
    
}
