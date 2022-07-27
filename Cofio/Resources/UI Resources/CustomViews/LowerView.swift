//
//  LowerView.swift
//  Cofio
//
//  Created by Владислав Сизонов on 27.07.2022.
//

import UIKit

final class LowerView: UIView {

    init() {
        super.init(frame: .zero)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        layer.cornerRadius = 20
        backgroundColor = .base
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 3)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
