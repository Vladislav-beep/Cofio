//
//  SubtitleLabel.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class SubtitleLabel: UILabel {
    
    let subtitle: String
    
    init(subtitle: String) {
        self.subtitle = subtitle
        super.init(frame: .zero)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        font = UIFont.systemFont(ofSize: 17, weight: .regular)
        numberOfLines = 0
        text = "Изучение иностранных языков c кем и чеком и чебуреком с сыром и мясом лол ушцкрпм лдылмттлывм вымо"
        translatesAutoresizingMaskIntoConstraints = false
    }
}
