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
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        searchBar.delegate = self
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.showsScopeBar = true
    }
    

     func handleAlbums(albumName: String) {
        let urlString = "https://itunes.apple.com/search?term=\(albumName)&entity=album&attribute=albumTerm"
        DataHanding.shared.handing(urlString: urlString) { [weak self] albumsModel, error in
            if error == nil {
                AlbumsViewController.hArray.append(albumName)
                guard let albumsModel = albumsModel else {
                    return
                }
                
                self?.albums = albumsModel.results
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

extension AlbumsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumsCollectionViewCell", for: indexPath) as! AlbumsCollectionViewCell
        let album = albums[indexPath.row]
        cell.setup(album: album)
        return cell
    }
}

extension AlbumsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 200)
    }
}

extension AlbumsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as? AlbumsCollectionViewCell
        let album = albums[indexPath.row]
//        let hvc = HistoryViewController()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailInformationViewController") as! DetailInformationViewController
//        HistoryViewController.hArray.append(album.artistName)
//        AlbumsViewController.hArray.append(album.artistName)
        vc.dAlbum = album
        vc.image = cell?.albumImageView.image
        navigationController?.pushViewController(vc, animated: true)

        

    }
}


extension AlbumsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
 
        let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        if text != "" {
            timer.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false, block: { [weak self] _ in
                self?.handleAlbums(albumName: text!)
                
            })
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.setShowsCancelButton(true, animated: true)

    }
}
