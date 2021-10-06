//
//  ViewController.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 05.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var cards: [Model] = []
    let net = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableViewContfigure()
        setupConstraints()
        
        net.getList { result in
            switch result {
            case .success(let items):
                self.cards = items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                fatalError("Error: \(error)")
            }
        }
    }
    
    private func tableViewContfigure() {
        tableView.backgroundColor = .orange
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }
    
}

//MARK: - Setup contstraints
extension ViewController {
    private func setupConstraints() {
        // TableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 60),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 10),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10),
            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -40)
        ])
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath)
        
        var configuration = cell.defaultContentConfiguration()
        configuration.image = UIImage.remove
        configuration.text = cards[indexPath.row].name
        configuration.secondaryText = cards[indexPath.row].description
        
        cell.contentConfiguration = configuration
        cell.backgroundColor = .gray
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.configure(with: cards[indexPath.row])
        navigationController?.present(vc, animated: true)
    }
}

//MARK: - Setup Canvas
import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ViewController()
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
