//
//  AlbumsModel.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 15.10.2021.
//

import Foundation

// MARK: - Album Model


struct AlbumsModel: Decodable, Equatable {
    let results: [Album]
}

struct Album: Decodable, Equatable {
    let artistName: String
    let collectionName: String
    let artworkUrl100: String?
    let trackCount: Int
    let country: String
    let releaseDate: String
    let primaryGenreName: String
}



