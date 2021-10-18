//
//  HistoryViewController.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 16.10.2021.
//

import UIKit


class HistoryViewController: UIViewController {

    
    @IBOutlet weak var hTableView: UITableView!

    var timer = Timer()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        hTableView.delegate = self
        hTableView.dataSource = self
        viewWillAppear(true)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        hTableView.reloadData()
        
    }
    

}


extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let albumVC = storyBoard.instantiateViewController(withIdentifier: "AlbumsViewController") as! AlbumsViewController
        self.navigationController?.show(albumVC, sender: indexPath)
        navigationItem.hidesBackButton = true
        let tForSearch = AlbumsViewController.hArray[indexPath.row]
        albumVC.handleAlbums(albumName: "\(tForSearch)")
                
    }
}

extension HistoryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlbumsViewController.hArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = AlbumsViewController.hArray[indexPath.row]
        return cell
    }
}





