//
//  DetailViewController.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 05.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.remove
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Name"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Description"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateAtLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Date"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(dateAtLabel)
        
        setupConstraints()
    }
    
    func configure(with card: Model) {
        imageView.image = UIImage()
        nameLabel.text = card.name
        descriptionLabel.text = card.description
        dateAtLabel.text = card.createdAt
    }
    
}

//MARK: - Setup contstraints
extension DetailViewController {
    private func setupConstraints() {
        // imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 60),
            imageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.3),
            imageView.heightAnchor.constraint(
                equalTo: imageView.widthAnchor
                )
        ])
        
        // nameLabel
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: 60),
            nameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 10),
            nameLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10)
        ])
        
        // descriptionLabel
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 60),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 10),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10)
        ])
        
        // dateAtLabel
        NSLayoutConstraint.activate([
            dateAtLabel.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: 60),
            dateAtLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 10),
            dateAtLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10)
        ])
    }
}


//MARK: - Setup Canvas
import SwiftUI
struct DetailViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = DetailViewController()
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
