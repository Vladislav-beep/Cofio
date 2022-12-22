//
//  ChooseIconViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 22.12.2022.
//

import UIKit

final class ChooseIconViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: ChooseIconViewOutput
    
    private lazy var closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return closeButton
    }()
    
    // MARK: Lifecycle
    
    init(output: ChooseIconViewOutput) {
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
            closeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // MARK: Actions
    
    @objc func close() {
        output.closeModule()
    }
}

// MARK: - ChooseIconViewInput

extension NewCollectionViewController: ChooseIconViewInput {}
