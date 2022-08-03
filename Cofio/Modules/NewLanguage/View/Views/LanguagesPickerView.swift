//
//  LanguagesPickerView.swift
//  Cofio
//
//  Created by Владислав Сизонов on 28.07.2022.
//

import UIKit

final class LanguagesPickerView: UIView {
    
    // MARK: Private properties
    
    private let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private let languageLabel: UILabel = {
        let languageLabel = UILabel()
        languageLabel.font = UIFont.systemFont(ofSize: 20)
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        return languageLabel
    }()
    
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    // MARK: Private
    
    private func setup() {
        addSubview(iconView)
        addSubview(languageLabel)
        
        let iconWidth: CGFloat = 35.0
        
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: iconWidth),
            iconView.heightAnchor.constraint(equalToConstant: iconWidth),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -80),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            languageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            languageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            languageLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10.0)
        ])
    }
    
    
    // MARK: Public
    
    static func create(icon: UIImage, title: String) -> LanguagesPickerView {
        let languageView = LanguagesPickerView()
        languageView.iconView.image = icon
        languageView.languageLabel.text = title
        
        return languageView
    }
}
