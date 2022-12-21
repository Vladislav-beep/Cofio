//
//  CollectionTextField.swift
//  Cofio
//
//  Created by Владислав Сизонов on 27.07.2022.
//

import UIKit

class CollectionTextField: UITextField {

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
        placeholder = "collection_textField_placeholder"~
        borderStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 5))
        leftViewMode = .always
        leftView = view
    }
}
