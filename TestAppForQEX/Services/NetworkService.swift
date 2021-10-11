//
//  NetworkService.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 05.10.2021.
//

import Foundation
import UIKit
import Kingfisher

class NetworkService: NetworkServiceProtocol {
    
    private let baseUrl = "https://scripts.qexsystems.ru/test_ios/public"
    
    func getList(complition: @escaping (Result<[Model], Error>) -> ()) {
        let stringUrl = baseUrl + "/api/posts"
        guard let url = URL(string: stringUrl) else { fatalError("Invalid url") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            
            guard let data = data else { fatalError("Data not found") }
            
            do {
                let object = try JSONDecoder().decode(Posts.self, from: data)
                complition(.success(object.posts))
            }
            catch {
                fatalError("Invalid decoding: \(error)")
            }
        }.resume()
    }
    
}
