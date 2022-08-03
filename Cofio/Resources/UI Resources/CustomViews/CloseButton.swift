//
//  CloseButton.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

import UIKit

final class CloseButton: UIButton {
    
    // MARK: Lifecycle
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func initialize() {
        setTitle(AppText.Common.close.rawValue, for: .normal)
        contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        setTitleColor(UIColor.darkViolet, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
