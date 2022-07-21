//
//  Vieww.swift
//  Cofio
//
//  Created by Владислав Сизонов on 20.07.2022.
//

import UIKit

final class Vieww: UIView {
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        title.numberOfLines = 0
        title.text = "Английский язык"
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        title.numberOfLines = 0
        title.text = "12 карточек"
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: 40),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
}
