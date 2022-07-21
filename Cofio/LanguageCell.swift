//
//  LanguageCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 21.07.2022.
//

import Foundation
import UIKit

final class LanguageCell: UICollectionViewCell {
    
    private lazy var lowerView: UIView = {
        let lowerView = UIView()
        lowerView.backgroundColor = .yellow
        lowerView.layer.cornerRadius = 10
        lowerView.translatesAutoresizingMaskIntoConstraints = false
        return lowerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(lowerView)
        NSLayoutConstraint.activate([
            lowerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            lowerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            lowerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            lowerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
