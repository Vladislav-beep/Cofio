//
//  RepetitionCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

final class RepetitionCell: UITableViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let title: String
        let repeats: Int
        let nextRepeat: String
        let repeatDate: Date
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
    
    private lazy var dateLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        subtitleLabel.numberOfLines = 1
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
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
        
        lowerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12)
        ])
        
        lowerView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12)
        ])
        
        lowerView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12),
            dateLabel.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupSubtitleLabel(with displayData: DisplayData) {
        if displayData.repeats == 7 {
            subtitleLabel.text = "Последнее повторение!"
        } else {
            subtitleLabel.text = "Следующее повторение"
        }
        
        if Calendar.current.isDateInToday(displayData.repeatDate) {
            subtitleLabel.text = "Нужно повторить"
            dateLabel.text = "Сегодня"
        } else if Calendar.current.isDateInYesterday(displayData.repeatDate) {
            subtitleLabel.text = "Нужно было повторить"
            dateLabel.text = "Вчера"
        } else if Calendar.current.isDateInTomorrow(displayData.repeatDate) {
            dateLabel.text = "Завтра"
        }
    }
    
    private func setupBackground(with displayData: DisplayData) {
        if displayData.repeatDate > Date() {
            lowerView.backgroundColor = .darkGreen
        } else if Calendar.current.isDateInToday(displayData.repeatDate) {
            lowerView.backgroundColor = .lightGreen
        } else {
            lowerView.backgroundColor = .darkRed
        }
    }
    
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        titleLabel.text = displayData.title
        dateLabel.text = displayData.nextRepeat
        setupSubtitleLabel(with: displayData)
        setupBackground(with: displayData)
    }
}
