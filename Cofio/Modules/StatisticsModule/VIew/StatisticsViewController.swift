//
//  StatisticsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 11.12.2022.
//

import UIKit

class StatisticsViewController: UIViewController {

    private lazy var titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(title: "Statistics Module")
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
    }
    
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
