//
//  NewCardViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

import UIKit

final class NewCardViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: NewCardViewOutput
 
    private let closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()
    
    private let wordTextView: WordTextView = {
        let wordTextView = WordTextView()
        return wordTextView
    }()
    
    private let translationTextView: WordTextView = {
        let translationTextView = WordTextView()
        return translationTextView
    }()
    
    private let sentenceTextView: WordTextView = {
        let sentenceTextView = WordTextView()
        return sentenceTextView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [wordTextView, translationTextView, sentenceTextView],
                                    axis: .vertical,
                                    spacing: 30,
                                    distribution: .fillEqually)
        stackView.setCustomSpacing(50, after: translationTextView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let doneButton: DoneButton = {
        let doneButton = DoneButton(title: "new_card_module_add_button_title"~)
        doneButton.addTarget(self, action: #selector(addWord), for: .touchUpInside)
        return doneButton
    }()
    
    
    // MARK: Lifecycle
    
    init(output: NewCardViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneButton.heightAnchor.constraint(equalToConstant: 56),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -40)
        ])
    }
    
    // MARK: Actions
    
    @objc func close() {
        output.closeModule()
    }
    
    @objc func addWord() {
        
    }
}


// MARK: - WordViewInput

extension NewCardViewController: NewCardViewInput {}
