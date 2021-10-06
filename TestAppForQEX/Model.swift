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

struct Model: Decodable {
    let name: String
    let description: String
    let createdAt: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case createdAt = "created_at"
    }
}
