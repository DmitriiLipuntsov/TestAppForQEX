//
//  MainPresenter.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 07.10.2021.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    private var view: MainViewProtocol
    private var coordinator: CoordinatorProtocol
    private var networkService: NetworkServiceProtocol
    
    var items: [Item] = []
    
    init(view: MainViewProtocol,
         router: CoordinatorProtocol,
         networkService: NetworkServiceProtocol) {
        self.view = view
        self.coordinator = router
        self.networkService = networkService
        
        getList()
    }
    
    func tapOnTheCell(index: Int) {
        let item = items[index]
        coordinator.showDetail(with: item)
    }
    
    private func getList() {
        self.networkService.getList { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let models):
                    self.items = models.map({ model -> Item in
                        return Item(
                            imageUrl: model.imageUrl,
                            name: model.name,
                            description: model.description,
                            createdAt: model.createdAt.convertDateFromat())
                    })
                    self.view.succes()
                case .failure(let error):
                    self.view.failure(error: error)
                }
            }
        }
    }
}
