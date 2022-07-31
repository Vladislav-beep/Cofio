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
    
    private lazy var lowerView: LowerView = {
        let view = LowerView()
        view.backgroundColor = .darkOrange
        return view
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
    }
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
     //   titleLabel.text = displayData.title
    }
}
