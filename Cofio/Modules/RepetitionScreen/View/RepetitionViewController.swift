//
//  RepetitionViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 16.08.2022.
//

import UIKit

final class RepetitionViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: RepetitionViewOutput
 
   
    
    
    // MARK: Lifecycle
    
    init(output: RepetitionViewOutput) {
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


extension RepetitionViewController: RepetitionViewInput {}

