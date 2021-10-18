//
//  DataHanding.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 15.10.2021.
//

import Foundation

class DataHanding {
    static let shared = DataHanding()
    
    //MARK: - JSON Decoder
    
    func handing(urlString: String, responce: @escaping(AlbumsModel?, Error?) -> Void ) {
        DataRequest.shared.dataRequest(urlString: urlString) { result in
            switch result {
                
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode(AlbumsModel.self, from: data)
                    responce(albums, nil)
                }catch let JSError{
                    print("\(JSError)")
                }
            case .failure(let error):
                print("\(error.localizedDescription)")
                responce(nil,error)
            }
        }
    }
}
