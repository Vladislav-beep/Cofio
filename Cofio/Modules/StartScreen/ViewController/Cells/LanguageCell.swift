//
//  LanguageCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 21.07.2022.
//

import Foundation
import UIKit

final class LanguageCell: UITableViewCell {
    
    let reuseId = "cell"
    
    struct DisplayData: Hashable {
        let title: String
        let collectionsCount: Int
    }
    
    private lazy var lowerView: LowerView = {
        let view = LowerView()
        return view
    }()
    
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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func configureSubtitleLabel(with count: Int) {
        let myAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
                           NSAttributedString.Key.foregroundColor: UIColor.darkOrange]
        let string = NSMutableAttributedString(string: "\(count)", attributes: myAttribute)
        let attrString = NSAttributedString(string: " сборников")
        string.append(attrString)
        
        subtitleLabel.attributedText = string
    }
    
    private func configureImage(with title: String) {
        switch title {
        case "Английский":
            iconView.image = UIImage(named: "England")
        case "Немецкий":
            iconView.image = UIImage(named: "Germany")
        case "Французский":
            iconView.image = UIImage(named: "France")
        default:
            iconView.backgroundColor = .red
        }
    }
    
    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
        configureSubtitleLabel(with: displayData.collectionsCount)
        configureImage(with: displayData.title)
    }
}
