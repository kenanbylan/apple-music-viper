//
//  MusicListViewController.swift
//  musicViper
//
//  Created by Kenan Baylan on 30.05.2023.

import Foundation
import UIKit


final class MusicListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}


extension MusicListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell", for: indexPath)
        
        cell.textLabel?.text = "deneme"
        cell.detailTextLabel?.text = "deneme2"
        return cell
        
    }
    
    
}


extension MusicListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
