//
//  NewCollectionViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class NewCollectionViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: NewCollectionViewOutput
    
    private lazy var closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()
    
    private let titleLabel: TitleLabel = {
        let titleLabel = TitleLabel(title: "new_collection_module_title"~)
        return titleLabel
    }()
    
    private let collectionTextField: CollectionTextField = {
        let collectionTextField = CollectionTextField()
        return collectionTextField
    }()
    
    private let thinView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("new_collection_module_button_title"~, for: .normal)
        doneButton.backgroundColor = .darkViolet
        doneButton.layer.cornerRadius = 15
        doneButton.addTarget(self, action: #selector(addNewCollection), for: .touchUpInside)
        return doneButton
    }()
    
    
    // MARK: Lifecycle
    
    init(output: NewCollectionViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        collectionTextField.delegate = self
        collectionTextField.becomeFirstResponder()
    }
    
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(collectionTextField)
        NSLayoutConstraint.activate([
            collectionTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            collectionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        view.addSubview(thinView)
        NSLayoutConstraint.activate([
            thinView.topAnchor.constraint(equalTo: collectionTextField.bottomAnchor, constant: -10),
            thinView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thinView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thinView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneButton.heightAnchor.constraint(equalToConstant: 56),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    
    // MARK: Actions
    
    @objc func close() {
        output.closeModule()
    }
    
    @objc func addNewCollection() {
        output.addNewCollection()
    }
}


// MARK: - NewCollectionViewInput 

extension NewCollectionViewController: NewCollectionViewInput {}

extension NewCollectionViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        collectionTextField.resignFirstResponder()
        return true
    }
}
