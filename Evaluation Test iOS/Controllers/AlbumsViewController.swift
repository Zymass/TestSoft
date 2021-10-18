//
//  ViewController.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 14.10.2021.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var albums = [Album]()
    var timer = Timer()
    
    static var hArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        searchBar.delegate = self
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.showsScopeBar = true
    }
    
    //MARK: - iTunes API urlRequest
     func handleAlbums(albumName: String) {
        let urlString = "https://itunes.apple.com/search?term=\(albumName)&entity=album&attribute=albumTerm"
        DataHanding.shared.handing(urlString: urlString) { [weak self] albumsModel, error in
            if error == nil {
                AlbumsViewController.hArray.append(albumName)
                guard let albumsModel = albumsModel else {
                    return
                }
                let sortedAlbums = albumsModel.results.sorted { first, second in
                    return first.collectionName.compare(second.collectionName) == ComparisonResult.orderedAscending
                }
                self?.albums = sortedAlbums
                self?.collectionView.reloadData()
            }else{
                print(error!.localizedDescription)
            }
        }
    }
     func setupSearchController() {
        searchBar.placeholder = "Search"
        searchBar.setShowsCancelButton(true, animated: true)
        
    }
}
