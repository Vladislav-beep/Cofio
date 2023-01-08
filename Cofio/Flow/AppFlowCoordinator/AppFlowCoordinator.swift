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

final class AppFlowCoordinator {
    
    // MARK: Private properties
    
    private let parentViewController: UIViewController
    private var childCoordinators = [FlowCoordinatorProtocol]()
    
    // MARK: Lifecycle
    
    required init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
}

// MARK: - FlowCoordinatorProtocol

extension AppFlowCoordinator: FlowCoordinatorProtocol {
    
    func start() {
        showMainFlow()
    }
    
    func finish(completion: (() -> Void)?) {
        // unused
    }
}

// MARK: - AppCoordinatorProtocol

extension AppFlowCoordinator: AppCoordinatorProtocol {
    
    func showMainFlow() {
        let tabCoordinator = TabbarFlowCoordinator(parentViewController: parentViewController)
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}
