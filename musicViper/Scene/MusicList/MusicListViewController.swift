//
//  MusicListViewController.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.
//

import Foundation
import UIKit


final class MusicListViewController: UIViewController {
    
  
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MusicListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }

    }
    private var musicList: [MusicPresentation] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.load()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
    }
}


extension MusicListViewController: MusicListViewModelDelegate {
    
    
    func handleViewModelOutput(_ output: MusicListViewModelOutput) {
        switch output {
            
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showMusicList(let musicList):
            self.musicList = musicList
            tableView.reloadData()
        }
        
    }
    
    
    
}


extension MusicListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell", for: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = musicList[indexPath.row].title
        cell.detailTextLabel?.text = musicList[indexPath.row].detail
        return cell
        
    }
    
    
}


extension MusicListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
