//
//  MovieListView.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.
//

import Foundation
import UIKit

final class MusicListView: UIView {
    private var musicList: [MusicPresentation] = []
    @IBOutlet private weak var tableView: UITableView!
    
     
    
    
}


extension MusicListView: MusicListViewProtocol {
    
    
    func updateMusicList(_ musicList: [MusicPresentation]) {
        self.musicList = musicList
        tableView.reloadData()
    }
    
    func setLoading(_ isLoading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
}



extension MusicListView: UITableViewDelegate  {
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMusic(at: indexPath.row)
    }
}



extension MusicListView: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell",for: indexPath)
        let music = musicList[indexPath.row]
        cell.textLabel?.text = music.title
        cell.detailTextLabel?.text = music.detail
        return cell
    }

}

