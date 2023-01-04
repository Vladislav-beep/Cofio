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
    
    func showCardsRepetitionModule(themeName: String) {
        let builder = CardsRepetitionModuleBuilder(output: self,
                                                   storageService: storageService,
                                                   themeName: themeName)
        let cardsRepetitionViewController = builder.build()
        
        parentViewController.pushViewController(cardsRepetitionViewController, animated: true)
    }
}

// MARK: FlowCoordinatorProtocol

extension RepetitionFlowCoordinator {
    func start() {
        showRepetitionModule()
    }
    
    func finish(completion: (() -> Void)?) {
        // TODO: finish
    }
}

// MARK: - RepetitionPresenterOutput

extension RepetitionFlowCoordinator: RepetitionPresenterOutput {
    
    func moduleWantsToOpenCardsRepetition(_ module: RepetitionPresenterInput, themeName: String) {
        showCardsRepetitionModule(themeName: themeName)
    }
}

// MARK: - CardsRepetitionPresenterOutput

extension RepetitionFlowCoordinator: CardsRepetitionPresenterOutput {}
