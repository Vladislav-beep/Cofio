//
//  WordTextView.swift
//  Cofio
//
//  Created by Владислав Сизонов on 07.08.2022.
//

import UIKit

final class WordTextView: UITextView {
    
    private let urlButton: UIButton = {
        let urlButton = UIButton()
        urlButton.backgroundColor = .red
        urlButton.translatesAutoresizingMaskIntoConstraints = false
        return urlButton
    }()

    // MARK: Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
          super.init(frame: frame, textContainer: textContainer)
          initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func initialize() {
        textColor = .black
        layer.cornerRadius = 20
        backgroundColor = .base
        font = UIFont.systemFont(ofSize: 22)
        layer.borderWidth = 2
        layer.borderColor = UIColor.darkViolet.cgColor
        textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
