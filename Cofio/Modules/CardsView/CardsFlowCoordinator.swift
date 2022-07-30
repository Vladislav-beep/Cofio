//
//  CardsFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

protocol CardsFlowCoordinatorOutput: AnyObject {}

final class CardsFlowCoordinator {
    
    private weak var parentViewController: UIViewController?
    private weak var parentTabBarController: UITabBarController?
    private weak var output: CardsFlowCoordinatorOutput?
    
    init(tabBar: UITabBarController, output: CardsFlowCoordinatorOutput?) {
        self.parentTabBarController = tabBar
        self.output = output
    }
    
    private func showCardsModule() {
        let builder = CardsModuleBuilder(output: self)
        let vc = builder.build()
        
        parentTabBarController?.setViewControllers([vc], animated: true)
    }
}

extension CardsFlowCoordinator: FlowCoordinatorProtocol {
    
    func start() {
        showCardsModule()
    }
    
    func finish() {
        // unused
    }
}

extension CardsFlowCoordinator: CardsPresenterOutput {
    
}
