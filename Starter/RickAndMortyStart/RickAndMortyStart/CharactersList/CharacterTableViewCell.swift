//
//  CharacterTableViewCell.swift
//  RickAndMortyStart
//
//  Created by Yelyzaveta Lipatova on 09.08.2023.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
        
    private enum Config {
        static let subviewsSpacing: CGFloat = 10
        static let imageHeight: CGFloat = 120
        static let defaultImage: UIImage? = .init(named: "defaultImage")
        static let textFont: UIFont? = .init(name: "Avenir", size: 25)
    }
    
    static let identifier = "CharacterTableViewCell"
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Config.defaultImage
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Config.textFont
        label.textColor = .purple
        label.numberOfLines = 0
        
        return label
    }()
    
    var character: CharactersQueryResponse.Character? {
        didSet {
            nameLabel.text = character?.name ?? ""
            if let character = character, let url = URL(string: character.image) {
                Task {
                    await image.load(url: url)
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
        
    private func setupConstraints() {
        contentView.addSubview(image)
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: Config.imageHeight),
            image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 1),
            image.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -Config.subviewsSpacing),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
