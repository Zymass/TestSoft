//
//  HistoryVC.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 18.10.2021.
//

import UIKit

// MARK: - Open View with search

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

// MARK: - Set count of cells

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return AlbumsViewController.hArray.count
}


// MARK: - Set content of cell

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = AlbumsViewController.hArray[indexPath.row]
    return cell
}
}
