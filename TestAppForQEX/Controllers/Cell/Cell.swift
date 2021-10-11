//
//  Cell.swift
//  TestAppForQEX
//
//  Created by Михаил Липунцов on 06.10.2021.
//

import UIKit

class Cell: UICollectionViewListCell {
    
    static let identifier = "Cell"
    
    internal let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.remove
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    func configure(whith model: Item) {
        if let stringUrl = model.imageUrl {
            imageView.kf.setImage(with: URL(string: stringUrl))
        } else {
            imageView.image = UIImage.remove
        }

        nameLabel.text = model.name
        descriptionLabel.text = model.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Setup contstraints
extension Cell {
    private func setupConstraints() {
        // imageView
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 5),
            imageView.centerYAnchor.constraint(
                equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(
                equalToConstant: 55),
            imageView.heightAnchor.constraint(
                equalToConstant: 55)
        ])
        
        // nameLabel
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 20),
            nameLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: 10),
            nameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10),
        ])
        
        // descriptionLabel
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 5),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor,
                constant: 10),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -50),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -10),
        ])
    }
}
