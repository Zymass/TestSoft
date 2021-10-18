//
//  DateRequest.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 15.10.2021.
//

import Foundation

class DataRequest {
        static let shared = DataRequest()
        
    
    //MARK: - URL Request Data
    func dataRequest(urlString: String, completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))

            }
        }
        .resume()
    }
}
