//
//  MainFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class MainFlowCoordinator: FlowCoordinatorProtocol {
    
    // MARK: Private
    
    private let parentViewController: UINavigationController
    private var mainModuleViewController: UIViewController?
    
    
    // MARK: Lifecycle
    
    init(parentViewController: UINavigationController) {
        self.parentViewController = parentViewController
    }
    
    
    // MARK: Public
    
    func showMainModule() {
        let builder = MainModuleBuilder(output: self)
        let mainViewController = builder.build()
        
        mainModuleViewController = mainViewController
        parentViewController.pushViewController(mainViewController, animated: true)
    }
    
    func showNewCollectionModule() {
        let builder = NewCollectionModuleBuilder(output: self)
        let newCollectionViewController = builder.build()

        newCollectionViewController.modalPresentationStyle = .fullScreen
        mainModuleViewController?.present(newCollectionViewController, animated: true)
    }
}

// MARK: - FlowCoordinatorProtocol

extension MainFlowCoordinator {
    func start() {
        showMainModule()
    }
    
    func finish(completion: (() -> Void)?) {
        
    }
}


// MARK: - MainPresenterOutput

extension MainFlowCoordinator: MainPresenterOutput {

    func moduleWantsToAddNewCollection(_ module: MainPresenterInput) {
        showNewCollectionModule()
    }
}


// MARK: - NewLanguagePresenterOutput

extension MainFlowCoordinator: NewCollectionPresenterOutput {
    
    func moduleWantsToClose(_ module: NewCollectionPresenterInput) {
        mainModuleViewController?.dismiss(animated: true)
    }
}
