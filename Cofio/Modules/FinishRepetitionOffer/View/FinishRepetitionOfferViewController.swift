//
//  FinishRepetitionOfferViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 06.01.2023.
//

import UIKit

final class FinishRepetitionOfferViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: FinishRepetitionOfferViewOutput
    
    private lazy var closeButton: CloseButton = {
        let closeButton = CloseButton()
        closeButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return closeButton
    }()
    
    // MARK: Lifecycle
    
    init(output: FinishRepetitionOfferViewOutput) {
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
    
    @objc func didTapButton() {
        
    }
    
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
}

// MARK: - FinishRepetitionOfferViewInput

extension FinishRepetitionOfferViewController: FinishRepetitionOfferViewInput {}
