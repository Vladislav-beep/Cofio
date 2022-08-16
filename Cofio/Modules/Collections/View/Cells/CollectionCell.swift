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

    private lazy var lowerView: LowerView = {
        let view = LowerView()
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.numberOfLines = 1
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    private lazy var persentLabel: UILabel = {
        let persentLabel = UILabel()
        persentLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        persentLabel.numberOfLines = 1
        persentLabel.textAlignment = .center
        persentLabel.translatesAutoresizingMaskIntoConstraints = false
        return persentLabel
    }()
    
    private lazy var progressView: HorizontalProgressBar = {
        let progress = HorizontalProgressBar()
        progress.backgroundColor = .white
        progress.layer.borderWidth = 1
        progress.layer.borderColor = UIColor.darkViolet.cgColor
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
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
        
        lowerView.addSubview(persentLabel)
        NSLayoutConstraint.activate([
            persentLabel.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 10),
            persentLabel.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -16),
            persentLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
            persentLabel.heightAnchor.constraint(equalTo: persentLabel.widthAnchor)
        ])
        
        lowerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
        ])
        
        lowerView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
            subtitleLabel.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -16)
        ])
        
        lowerView.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -16),
            progressView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 4),
            progressView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -6)
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
        var k = 0.0
        if progress == 8 {
            k = 1.0
        } else {
            k = Double(100 / 8 * progress) / 100
        }
        progressView.progress = CGFloat(k)
    }
    
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
        if displayData.repeats == 8 {
            persentLabel.text = "100 %"
        } else {
            persentLabel.text = String(100 / 8 * displayData.repeats) + " %"
        }
        configureSubtitleLabel(with: displayData.cardsCount)
        updateProgress(with: displayData.repeats)
    }
}
