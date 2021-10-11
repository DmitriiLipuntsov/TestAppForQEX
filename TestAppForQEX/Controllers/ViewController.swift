//
//  ViewController.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 05.10.2021.
//

import UIKit
import Kingfisher

enum Section: Hashable {
    case main
}

class ViewController: UIViewController {
    
    var presenter: MainPresenterProtocol!
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    private let activitiIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "List"
        
        collectionViewConfigure()
        configureDataSource()
        setupActivitiIndicator()
        setupConstraints()
    }
    
    private func collectionViewConfigure() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: setupCollectionViewLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        collectionView.backgroundColor = .green
    }
    
    private func setupActivitiIndicator() {
        activitiIndicator.style = .large
        activitiIndicator.startAnimating()
        activitiIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activitiIndicator)
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(presenter.items)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

//MARK: - Setup contstraints
extension ViewController {
    private func setupConstraints() {
        // TableView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 60),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 10),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10),
            collectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -40)
        ])
        
        // ActivitiIndicator
        NSLayoutConstraint.activate([
            activitiIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            activitiIndicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor)
        ])
    }
}

//MARK: - Setup CollectionView layout
extension ViewController {
    private func setupCollectionViewLayout() -> UICollectionViewLayout {
        let configure = UICollectionLayoutListConfiguration(
            appearance: .plain)
        
        let layout = UICollectionViewCompositionalLayout.list(
            using: configure)
        
        return layout
    }
}

//MARK: - UICollectionViewDataSource
extension ViewController {
    private func configureDataSource() {
        let cellRegistration = UICollectionView
            .CellRegistration<Cell, Item> { cell, indexPath, item in
                cell.configure(whith: item)
                cell.accessories = [.disclosureIndicator()]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(presenter.items)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.tapOnTheCell(index: indexPath.row)
    }
}

//MARK: - MainViewProtocol
extension ViewController: MainViewProtocol {
    func succes() {
        reloadData()
        activitiIndicator.stopAnimating()
        activitiIndicator.isHidden = true
    }
    
    func failure(error: Error) {
        print(error)
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
