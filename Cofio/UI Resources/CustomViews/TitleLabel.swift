//
//  TitleLabel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class TitleLabel: UILabel {
    
    let title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        font = UIFont.systemFont(ofSize: 30, weight: .bold)
        numberOfLines = 0
        text = title
        translatesAutoresizingMaskIntoConstraints = false
    }
}
