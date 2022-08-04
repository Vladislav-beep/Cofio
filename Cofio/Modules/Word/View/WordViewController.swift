//
//  WordViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 03.08.2022.
//

import UIKit

final class WordViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: WordViewOutput
 
    private let closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()
    
    private lazy var wordTextView: UITextView = {
        let wordTextView = UITextView()
        wordTextView.layer.cornerRadius = 10
        wordTextView.backgroundColor = .orange
        wordTextView.font = UIFont.systemFont(ofSize: 18)
        wordTextView.translatesAutoresizingMaskIntoConstraints = false
        return wordTextView
    }()
    
    private lazy var translationTextView: UITextView = {
        let translationTextView = UITextView()
        translationTextView.layer.cornerRadius = 10
        translationTextView.backgroundColor = .orange
        translationTextView.font = UIFont.systemFont(ofSize: 18)
        translationTextView.translatesAutoresizingMaskIntoConstraints = false
        return translationTextView
    }()
    
    private lazy var sentenceTextView: UITextView = {
        let sentenceTextView = UITextView()
        sentenceTextView.layer.cornerRadius = 10
        sentenceTextView.backgroundColor = .orange
        sentenceTextView.font = UIFont.systemFont(ofSize: 18)
        sentenceTextView.translatesAutoresizingMaskIntoConstraints = false
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
        let doneButton = DoneButton(title: "Добавить")
        doneButton.addTarget(self, action: #selector(addWord), for: .touchUpInside)
        return doneButton
    }()
    
    
    // MARK: Lifecycle
    
    init(output: WordViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
    }
    
    private func setupViews() {

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
    
    private func setupNavigationBar() {
        title = "Повторение"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.darkViolet
    }
    
    // MARK: Actions
    
    @objc func close() {
        output.closeModule()
    }
    
    @objc func addWord() {
        print("rvwrv")
    }
}


extension WordViewController: WordViewInput {}
