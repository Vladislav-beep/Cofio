//
//  LanguageTextField.swift
//  Cofio
//
//  Created by Владислав Сизонов on 27.07.2022.
//

import UIKit

class LanguageTextField: UITextField {

    // MARK: Life Time
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func initialize() {
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.orange.cgColor
        layer.cornerRadius = 10
        placeholder = "Выберите язык"
        borderStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5))
        leftViewMode = .always
        leftView = view
    }
}
