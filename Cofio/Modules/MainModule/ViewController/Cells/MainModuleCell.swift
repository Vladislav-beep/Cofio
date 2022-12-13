//
//  MainModuleCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 21.07.2022.
//

import UIKit

final class MainModuleCell: UITableViewCell {
    
    // MARK: Public data structures
    
    struct DisplayData: Hashable {
        let title: String
        let collectionsCount: Int
    }
    
    
    // MARK: Private properties
    
    private lazy var lowerView: LowerView = {
        let view = LowerView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.numberOfLines = 1
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.numberOfLines = 1
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.clipsToBounds = true
        iconView.layer.cornerRadius = 15
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
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
        let string1: String
        switch count {
        case 1:
            string1 = " сборник"
        case 2...4:
            string1 = " сборника"
        case 5...Int.max:
            string1 = " сборников"
        default:
            string1 = " сборников"
        }
        let myAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
                           NSAttributedString.Key.foregroundColor: UIColor.darkOrange]
        let countString = NSMutableAttributedString(string: "\(count)", attributes: myAttribute)
        let attrString = NSAttributedString(string: string1)
        if count == 0 {
            subtitleLabel.text = "Нет сборников"
        } else {
            countString.append(attrString)
            subtitleLabel.attributedText = countString
        }
    }
    
    private func configureImage(with title: String) -> UIImage {
        return ImageProvider().configureLanguageCell(with: title)
    }
    
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        if displayData.title == AppText.StartAppScreen.hindi.rawValue {
            titleLabel.text = displayData.title
        } else {
            titleLabel.text = displayData.title + " язык"
        }
        
        iconView.image = configureImage(with: displayData.title)
        configureSubtitleLabel(with: displayData.collectionsCount)
    }
}
