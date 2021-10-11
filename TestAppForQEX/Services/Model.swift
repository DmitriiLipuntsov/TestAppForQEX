//
//  Card.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 05.10.2021.
//

import Foundation

struct Posts: Decodable {
    let posts: [Model]
}

struct Model: Decodable, Hashable {
    let name: String
    var imageUrl: String? = nil
    let description: String
    let createdAt: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case imageUrl = "photo"
        case createdAt = "created_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        if let imageUrlComponent = try? container.decode(String.self, forKey: .imageUrl) {
            let baseUrl = "https://scripts.qexsystems.ru/test_ios/public"
            imageUrl = baseUrl + imageUrlComponent
        }
        
        description = try container.decode(String.self, forKey: .description)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        id = try container.decode(Int.self, forKey: .id)
    }
}
