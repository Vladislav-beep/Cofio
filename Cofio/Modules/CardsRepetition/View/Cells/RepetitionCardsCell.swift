//
//  RepetitionCardsCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.01.2023.
//

import UIKit

final class RepetitionCardsCell: UICollectionViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let definition: String
        let description: String
    }
    
    // MARK: Private properties
    
    private lazy var lowerView: LowerView = {
        let view = LowerView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let wordLabel = UILabel()
        wordLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        wordLabel.numberOfLines = 0
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        return wordLabel
    }()
    
    private let thinView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let definitionLabel: UILabel = {
        let translationLabel = UILabel()
        translationLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        translationLabel.numberOfLines = 0
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        return translationLabel
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    
    private func setupViews() {
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        
        contentView.addSubview(lowerView)
        NSLayoutConstraint.activate([
            lowerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lowerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lowerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lowerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
        lowerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
        ])
        
        lowerView.addSubview(thinView)
        NSLayoutConstraint.activate([
            thinView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            thinView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -50),
            thinView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            thinView.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        lowerView.addSubview(definitionLabel)
        NSLayoutConstraint.activate([
            definitionLabel.topAnchor.constraint(equalTo: thinView.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            definitionLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
            definitionLabel.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -12),
        ])
    }
    
    // MARK: Public
    
    func configure(displayData: DisplayData) {
        titleLabel.text = displayData.definition
        definitionLabel.text = displayData.description
    }
}
