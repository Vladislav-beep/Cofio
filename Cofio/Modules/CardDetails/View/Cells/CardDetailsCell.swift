//
//  CardDetailsCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.12.2022.
//

import UIKit

final class CardDetailsCell: UITableViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let title: String
        let definition: String
    }
    
    // MARK: Private properties

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private let thinView: UIView = {
        let thinView = UIView()
        thinView.backgroundColor = .gray
        thinView.layer.cornerRadius = 2
        thinView.translatesAutoresizingMaskIntoConstraints = false
        return thinView
    }()

    private let definitionLabel: UILabel = {
        let definitionLabel = UILabel()
        definitionLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        definitionLabel.numberOfLines = 0
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        return definitionLabel
    }()
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
        
        contentView.addSubview(thinView)
        NSLayoutConstraint.activate([
            thinView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            thinView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            thinView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            thinView.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        contentView.addSubview(definitionLabel)
        NSLayoutConstraint.activate([
            definitionLabel.topAnchor.constraint(equalTo: thinView.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            definitionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            definitionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
        definitionLabel.text = displayData.definition
    }
}
