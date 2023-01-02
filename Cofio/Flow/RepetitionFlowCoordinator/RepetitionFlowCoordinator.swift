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
    private let storageService: StorageServiceProtocol
    
    
    // MARK: Lifecycle
    
    init(parentViewController: UINavigationController,
         storageService: StorageServiceProtocol) {
        self.parentViewController = parentViewController
        self.storageService = storageService
    }
    
    
    // MARK: Public
    
    func showRepetitionModule() {
        let builder = RepetitionModuleBuilder(output: self,
                                              storageService: storageService)
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
