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
        let descriptionShown: Bool
    }
    
    // MARK: Private properties
    
    private let lowerView: LowerView = {
        let view = LowerView()
        return view
    }()
    
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

    private let definitionTextView: UITextView = {
        let definitionTextView = UITextView()
        definitionTextView.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        definitionTextView.backgroundColor = .base
        definitionTextView.translatesAutoresizingMaskIntoConstraints = false
        return definitionTextView
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
        
        lowerView.addSubview(definitionTextView)
        NSLayoutConstraint.activate([
            definitionTextView.topAnchor.constraint(equalTo: thinView.bottomAnchor, constant: 10),
            definitionTextView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            definitionTextView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -16),
            definitionTextView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -10)
        ])
    }
    
    // MARK: Public
    
    func configure(displayData: DisplayData) {
        titleLabel.text = displayData.definition
        definitionTextView.text = displayData.description
        definitionTextView.isHidden = !displayData.descriptionShown
        titleLabel.sizeToFit()
    }
}
