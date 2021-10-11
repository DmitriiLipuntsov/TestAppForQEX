//
//  NetworkServiceProtocol.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 07.10.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getList(complition: @escaping (Result<[Model], Error>) -> ())
}
