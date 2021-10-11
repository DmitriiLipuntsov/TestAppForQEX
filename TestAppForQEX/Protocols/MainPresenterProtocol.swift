//
//  MainPresenterProtocol.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 07.10.2021.
//

import Foundation

protocol MainPresenterProtocol {
    var items: [Item] { get }
    func tapOnTheCell(index: Int)
}

