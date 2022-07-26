//
//  CardsViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 26.07.2022.
//

import UIKit

final class CardsViewController: UIViewController {
    
    private let output: CardsViewOutput
    
    init(output: CardsViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }
}

extension CardsViewController: CardsViewInput {}

