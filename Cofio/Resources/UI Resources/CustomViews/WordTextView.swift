//
//  WordTextView.swift
//  Cofio
//
//  Created by Владислав Сизонов on 07.08.2022.
//

import UIKit

final class WordTextView: UITextView {
    
   // private let placeholderText: String
    
    private let urlButton: UIButton = {
        let urlButton = UIButton()
        urlButton.backgroundColor = .red
        urlButton.translatesAutoresizingMaskIntoConstraints = false
        return urlButton
    }()

    // MARK: Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        //  self.placeholderText = placeholderText
          super.init(frame: frame, textContainer: textContainer)
          initialize()
          setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func setupViews() {
        addSubview(urlButton)
        NSLayoutConstraint.activate([
            urlButton.heightAnchor.constraint(equalToConstant: 25),
            urlButton.widthAnchor.constraint(equalToConstant: 25),
            urlButton.topAnchor.constraint(equalTo: bottomAnchor),
            urlButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    private func initialize() {
     //   text = placeholderText
        textColor = .gray
        layer.cornerRadius = 20
        backgroundColor = .orange
        font = UIFont.systemFont(ofSize: 22)
        textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
