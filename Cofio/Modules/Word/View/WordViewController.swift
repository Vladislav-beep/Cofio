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
        view.backgroundColor = .white
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
}


extension WordViewController: WordViewInput {}
