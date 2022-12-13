//
//  RepetitionFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 13.12.2022.
//

import UIKit

final class RepetitionFlowCoordinator: FlowCoordinatorProtocol {
    
    // MARK: Private
    
    private let parentViewController: UINavigationController
    
    
    // MARK: Lifecycle
    
    init(parentViewController: UINavigationController) {
        self.parentViewController = parentViewController
    }
    
    
    // MARK: Public
    
    func showRepetitionModule() {
        let builder = RepetitionModuleBuilder(output: self)
        let repetitionViewController = builder.build()
        
        parentViewController.pushViewController(repetitionViewController, animated: true)
    }
}

// MARK: - FlowCoordinatorProtocol

extension RepetitionFlowCoordinator {
    func start() {
        showRepetitionModule()
    }
    
    func finish(completion: (() -> Void)?) {
        
    }
}

extension RepetitionFlowCoordinator: RepetitionPresenterOutput {
    
}
