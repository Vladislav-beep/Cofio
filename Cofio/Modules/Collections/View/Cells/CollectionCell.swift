//
//  CollectionCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

final class CollectionCell: UITableViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let title: String
        let subtitle: String
    }
    
    
    // MARK: Private properties
    
    private lazy var lowerView: LowerView = {
        let view = LowerView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        title.numberOfLines = 0
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.numberOfLines = 0
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.backgroundColor = .blue
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Private
    
    private func setupViews() {
        contentView.addSubview(lowerView)
        NSLayoutConstraint.activate([
            lowerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lowerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lowerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lowerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
        lowerView.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: 40),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 16),
            iconView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -15)
        ])
        
        lowerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -12),
        ])
        
        lowerView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -12),
            subtitleLabel.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
        subtitleLabel.text = displayData.subtitle
    }
}
