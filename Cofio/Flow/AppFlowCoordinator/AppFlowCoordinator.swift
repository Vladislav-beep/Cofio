//
//  AppFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.12.2022.
//

import UIKit

protocol AppCoordinatorProtocol: FlowCoordinatorProtocol {
    func showMainFlow()
}

final class AppFlowCoordinator: AppCoordinatorProtocol {
    
    var parentViewController: UIViewController
    var childCoordinators = [FlowCoordinatorProtocol]()
    
    required init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
    
    func start() {
        showMainFlow()
    }
    
    func finish(completion: (() -> Void)?) {
        // unused
    }
    
    func showMainFlow() {
        let tabCoordinator = TabbarFlowCoordinator(parentViewController: parentViewController)
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}
