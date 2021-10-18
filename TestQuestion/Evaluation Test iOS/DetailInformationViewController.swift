//
//  DetailInformation.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 16.10.2021.
//

import Foundation
import UIKit


class DetailInformationViewController:UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var primaryLabel: UILabel!
    

    var dAlbum:Album?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setModel()
    }
    
    

    

   private func setModel() {
        guard let album = dAlbum else {
            return
        }
        
        
        imageView.image = image
        nameLabel.text = album.artistName
        collectionLabel.text = album.collectionName
        trackCountLabel.text = "\(album.trackCount)"
        countryLabel.text = album.country
        dateLabel.text = setDateFormat(date: album.releaseDate)
        primaryLabel.text = album.primaryGenreName
        
    }
    
    private func setDateFormat(date: String) ->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        guard let albumDate = dateFormatter.date(from: date) else { return "" }
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd-MM-yyyy"
        let date = formatDate.string(from: albumDate)
        
        
        
        
        return date
    }
    
}
