//
//  NetworkService.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 05.10.2021.
//

import Foundation

class NetworkService {
    
    let baseUrl = "https://scripts.qexsystems.ru/test_ios/public/api/posts"
    
    func getList(complition: @escaping (Result<[Model], Error>) -> ()) {
        guard let url = URL(string: baseUrl) else { fatalError("Invalid url") }
        
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
