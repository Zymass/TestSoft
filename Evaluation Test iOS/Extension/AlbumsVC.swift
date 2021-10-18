//
//  AlbumsVC.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 18.10.2021.
//

import UIKit

//MARK: - Set count and content of CollectionViewCell
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

//MARK: - Set Layout of cell
extension AlbumsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 128)
    }
}

// MARK: - Get Data to collection view

extension AlbumsViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as? AlbumsCollectionViewCell
        let album = albums[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailInformationViewController") as! DetailInformationViewController
        vc.dAlbum = album
        vc.image = cell?.albumImageView.image
        navigationController?.pushViewController(vc, animated: true)

        

    }
}


extension AlbumsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // MARK: - Encoding russian letters

        let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        // MARK: - Set timer urlRequest

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
