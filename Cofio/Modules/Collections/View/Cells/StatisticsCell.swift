//
//  StatisticsCell.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

final class StatisticsCell: UITableViewCell {
    
    // MARK: Data structures
    
    struct DisplayData: Hashable {
        let title: String
    }
    
    // MARK: Private properties
    
    private lazy var lowerView: LowerView = {
        let view = LowerView()
        view.backgroundColor = .darkOrange
        return view
    }()
    
    private lazy var progress: HorizontalProgressBar = {
        let progress = HorizontalProgressBar()
        progress.backgroundColor = .blue
        progress.progress = 0.3
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
            lowerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
        
        lowerView.addSubview(progress)
        NSLayoutConstraint.activate([
            progress.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 20),
            progress.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 16),
            progress.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -16),
            progress.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    // MARK: Public
    
    func configure(with displayData: DisplayData) {
        UIView.animate(withDuration: 2, delay: 1, options: .autoreverse) {
            self.progress.progress = 0.8
        } completion: { _ in

        }

    }
}
