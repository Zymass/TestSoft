//
//  AlbumsCollectionViewCell.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 14.10.2021.
//

import UIKit

class AlbumsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var countOfSongs: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    // MARK: - Set values for cell's values

    
    func setup(album: Album) {
        
        if let urlString = album.artworkUrl100 {
            DataRequest.shared.dataRequest(urlString: urlString) {[weak self] result in
                switch result {
                    
                case .success(let data):
                    let image = UIImage(data: data)
                    self?.albumImageView.image = image
                case .failure(let error):
                    self?.albumImageView.backgroundColor = .red
                    print(error.localizedDescription)
                }
            }
        }else{
            albumImageView.backgroundColor = .red
        }
        
        albumLabel.text = album.collectionName
        countOfSongs.text = "\(album.trackCount) songs"
        artistName.text = album.artistName
    }
}
