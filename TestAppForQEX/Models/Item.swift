//
//  Item.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 11.10.2021.
//

import Foundation

struct Item: Hashable {
    let imageUrl: String?
    let name: String
    let description: String
    let createdAt: String
    private let identifier = UUID()
}
