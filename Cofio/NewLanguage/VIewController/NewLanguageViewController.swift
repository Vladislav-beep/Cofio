//
//  NewLanguageViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class NewLanguageViewController: UIViewController {
    
    private let output: NewLanguageViewOutput
    
    private lazy var closeButton: UIButton = {
        let buton = UIButton()
        buton.translatesAutoresizingMaskIntoConstraints = false
        buton.setTitle("Закрыть", for: .normal)
        buton.addTarget(self, action: #selector(close), for: .touchUpInside)
        return buton
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(next1), for: .touchUpInside)
        return nextButton
    }()
    
    init(output: NewLanguageViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func close() {
        output.close()
    }
    
    @objc func next1() {
        output.next()
    }
}


extension NewLanguageViewController: NewLanguageViewInput {}
