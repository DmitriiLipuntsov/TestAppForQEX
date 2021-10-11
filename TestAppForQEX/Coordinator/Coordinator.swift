//
//  Router.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 07.10.2021.
//

import UIKit

/*
 Возможно правельнее было бы разделить логику на роутер и билдер, но сделал так. Так же можно было создать отдельный презентер для экрана детальной информации, но практической пользы не вижу от этого.
 */

class Coordinator: CoordinatorProtocol {
    
    var currentNavigationController: UINavigationController?
    
    init() {
        let vc = createMainVC()
        currentNavigationController = UINavigationController(rootViewController: vc)
    }
    
    func createMainVC() -> UIViewController {
        let vc = ViewController()
        let networkService = NetworkService()
        let presentor = MainPresenter(view: vc, router: self, networkService: networkService)
        vc.presenter = presentor
        
        return vc
    }
    
    func showDetail(with item: Item) {
        let vc = DetailViewController()
        vc.configure(with: item)
        currentNavigationController?.pushViewController(vc, animated: true)
    }
    
}
