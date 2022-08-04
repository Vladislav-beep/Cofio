//
//  DoneButton.swift
//  Cofio
//
//  Created by Владислав Сизонов on 04.08.2022.
//

import UIKit

final class DoneButton: UIButton {
    
    let title: String
    
    // MARK: Lifecycle
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func initialize() {
        setTitle(title, for: .normal)
        backgroundColor = .darkViolet
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
    }
}
