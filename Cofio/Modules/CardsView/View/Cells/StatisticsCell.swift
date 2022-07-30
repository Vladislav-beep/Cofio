//
//  StatisticsCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

final class StatisticsCell: UITableViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let title: String
    }
    
    // MARK: Private properties
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        title.numberOfLines = 0
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
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
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
    }
}
