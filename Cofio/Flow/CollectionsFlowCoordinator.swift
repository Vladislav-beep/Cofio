//
//  CollectionsFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

protocol CollectionsFlowCoordinatorOutput: AnyObject {}

final class CollectionsFlowCoordinator {
    
    private weak var parentViewController: UIViewController?
    private weak var parentTabBarController: UITabBarController?
    private weak var output: CollectionsFlowCoordinatorOutput?
    
    init(tabBar: UITabBarController, output: CollectionsFlowCoordinatorOutput?) {
        self.parentTabBarController = tabBar
        self.output = output
    }
    
    private func showCardsModule() {
        let builder = CollectionsModuleBuilder(output: self)
        let vc = builder.build()
        
        parentTabBarController?.present(vc, animated: true)
    }
}

extension CollectionsFlowCoordinator: FlowCoordinatorProtocol {
    
    func start() {
        showCardsModule()
    }
    
    func finish() {
        // unused
    }
}

extension CollectionsFlowCoordinator: CollectionsPresenterOutput {
    
    func moduleWantsToOpenRepetition(_ module: CollectionsPresenterInput) {
        
    }
    
    func moduleWantsToClose(_ module: CollectionsPresenterInput) {
        
    }
    
    func moduleWantsToOpenCards(_ module: CollectionsPresenterInput) {
        
    }
}
