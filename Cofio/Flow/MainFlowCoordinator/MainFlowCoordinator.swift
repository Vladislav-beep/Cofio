//
//  MainFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.07.2022.
//

import UIKit

final class MainFlowCoordinator {
    
    // MARK: Private
    
    private let parentViewController: UINavigationController
    private var mainModuleViewController: UIViewController?
    private weak var mainModule: MainPresenterInput?
    
    
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
    
    func showThemesModule(title: String) {
        let builder = ThemesModuleBuilder(output: self, navigationBarTitle: title)
        let themesViewController = builder.build()
        
        parentViewController.pushViewController(themesViewController, animated: true)
    }
}

// MARK: - FlowCoordinatorProtocol

extension MainFlowCoordinator: FlowCoordinatorProtocol {
    func start() {
        showMainModule()
    }
    
    func finish(completion: (() -> Void)?) {
        
    }
}


// MARK: - MainPresenterOutput

extension MainFlowCoordinator: MainPresenterOutput {

    func moduleDidLoad(_ module: MainPresenterInput) {
        mainModule = module
    }
    
    func moduleWantsToAddNewCollection(_ module: MainPresenterInput) {
        showNewCollectionModule()
    }
    
    func moduleWantsToOpenThemes(_ module: MainPresenterInput, title: String) {
        showThemesModule(title: title)
    }
}


// MARK: - NewCollectionPresenterOutput

extension MainFlowCoordinator: NewCollectionPresenterOutput {
    
    func moduleWantsToClose(_ module: NewCollectionPresenterInput) {
        mainModuleViewController?.dismiss(animated: true)
    }
    
    func moduleWantsToAddCollectionAndClose(_ module: NewCollectionPresenterInput) {
        mainModule?.refreshCollections()
        mainModuleViewController?.dismiss(animated: true)
    }
}


// MARK: - ThemesPresenterOutput

extension MainFlowCoordinator: ThemesPresenterOutput {

    func moduleWantsToOpenCards(_ module: ThemesPresenterInput) {
        
    }
    
    func moduleWantsToClose(_ module: ThemesPresenterInput) {
        parentViewController.popViewController(animated: true)
    }
}
