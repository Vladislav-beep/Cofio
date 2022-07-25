//
//  NewLanguageViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class NewLanguageViewController: UIViewController {
    
    private let output: NewLanguageViewOutput
    
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
    }
}


extension NewLanguageViewController: NewLanguageViewInput {}
