//
//  CollectionCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

final class CollectionCell: UITableViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let title: String
        let cardsCount: Int
        let repeats: Int
    }
    
    
    // MARK: Private properties
    
    private lazy var trailingConstraint: NSLayoutConstraint = gradient.widthAnchor.constraint(equalToConstant: 100)
    
    private lazy var lowerView: LowerView = {
        let view = LowerView()
        return view
    }()
    
    private lazy var gradient: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .lightViolet
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var clearView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var persentLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.numberOfLines = 1
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
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
            lowerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        lowerView.addSubview(gradient)
        NSLayoutConstraint.activate([
            gradient.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 0),
            gradient.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 0),
            trailingConstraint,
            gradient.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: 0),
        ])
        
        lowerView.addSubview(clearView)
        NSLayoutConstraint.activate([
            clearView.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 0),
            clearView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 0),
            clearView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: 0),
            clearView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: 0),
        ])
        
        clearView.addSubview(persentLabel)
        NSLayoutConstraint.activate([
            persentLabel.topAnchor.constraint(equalTo: clearView.topAnchor, constant: 10),
            persentLabel.bottomAnchor.constraint(equalTo: clearView.bottomAnchor, constant: -16),
            persentLabel.trailingAnchor.constraint(equalTo: clearView.trailingAnchor, constant: -12),
            persentLabel.heightAnchor.constraint(equalTo: persentLabel.widthAnchor)
        ])
        
        clearView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: clearView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: clearView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: clearView.trailingAnchor, constant: -12),
        ])
        
        clearView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: clearView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: clearView.trailingAnchor, constant: -12),
            subtitleLabel.bottomAnchor.constraint(equalTo: clearView.bottomAnchor, constant: -16)
        ])
    }
    
    private func configureSubtitleLabel(with count: Int) {
        let string1: String
        switch count {
        case 1:
            string1 = " карточка"
        case 2...4:
            string1 = " карточки"
        case 5...Int.max:
            string1 = " карточек"
        default:
            string1 = " карточек"
        }
        let myAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
                           NSAttributedString.Key.foregroundColor: UIColor.darkOrange]
        let countString = NSMutableAttributedString(string: "\(count)", attributes: myAttribute)
        let attrString = NSAttributedString(string: string1)
        if count == 0 {
            subtitleLabel.text = "Нет карточек"
        } else {
            countString.append(attrString)
            subtitleLabel.attributedText = countString
        }
    }
    
    private func updateProgress(with progress: Int) {
        if progress == 0 {
            trailingConstraint.constant = CGFloat(12)
        } else {
            let screenWidth = UIScreen.main.bounds.width - 32
            trailingConstraint.constant = screenWidth / 7 * CGFloat(progress)
        }
    }
    
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
        if displayData.repeats == 7 {
            persentLabel.text = "100 %"
        } else {
            persentLabel.text = String(100 / 7 * displayData.repeats) + " %"
        }
        configureSubtitleLabel(with: displayData.cardsCount)
        updateProgress(with: displayData.repeats)
    }
}
