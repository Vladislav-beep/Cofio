//
//  AppFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 10.12.2022.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func showMainFlow()
}

class AppFlowCoordinator: AppCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    var parentViewController: UIViewController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    
    required init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
    
    func start() {
        showMainFlow()
    }
    
    func showMainFlow() {
        let tabCoordinator = TabbarFlowCoordinator(parentViewController: parentViewController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}

extension AppFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
    }
}
