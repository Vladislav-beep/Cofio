//
//  CardsCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 31.07.2022.
//

import UIKit

final class CardsCell: UITableViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let meaning: String
        let translation: String
    }
    
    
    // MARK: Private properties
    
    private lazy var lowerView: LowerView = {
        let view = LowerView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titleLabel.numberOfLines = 1
        titleLabel.text = "Слово:"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var wordLabel: UILabel = {
        let wordLabel = UILabel()
        wordLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        wordLabel.numberOfLines = 0
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.numberOfLines = 1
        subtitleLabel.text = "Перевод:"
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    private lazy var translationLabel: UILabel = {
        let translationLabel = UILabel()
        translationLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        translationLabel.numberOfLines = 0
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        return translationLabel
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

        lowerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
        ])
        
        lowerView.addSubview(wordLabel)
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            wordLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
        ])

        lowerView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 6),
            subtitleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
        ])
        
        lowerView.addSubview(translationLabel)
        NSLayoutConstraint.activate([
            translationLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 0),
            translationLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            translationLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
            translationLabel.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -12),
        ])
    }
    
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        wordLabel.text = displayData.meaning
        translationLabel.text = displayData.translation
    }
}
