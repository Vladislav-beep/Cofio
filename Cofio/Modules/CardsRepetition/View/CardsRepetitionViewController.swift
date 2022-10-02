//
//  CardsRepetitionViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

import UIKit

final class CardsRepetitionViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: CardsRepetitionViewOutput

    
    // MARK: Lifecycle
    
    init(output: CardsRepetitionViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


// MARK: - CardsRepetitionViewInput

extension CardsRepetitionViewController: CardsRepetitionViewInput {}
