//
//  TabBarFlowCoordinator.swift
//  Cofio
//
//  Created by Владислав Сизонов on 30.07.2022.
//

import UIKit

protocol TabBarModuleFlowOutput: AnyObject {
    
}

final class TabBarFlowCoordinator {
    
    private weak var parentViewController: UIViewController?
    private weak var tabBarViewController: UITabBarController?
    private weak var output: TabBarModuleFlowOutput?
    
    init(parentViewController: UIViewController, output: TabBarModuleFlowOutput?) {
        self.parentViewController = parentViewController
        self.output = output
    }
    
    private func showTabBarModule() {
        let builder = TabBarModuleBuilder(output: self)
        let tabBar = builder.build()
        
        parentViewController?.present(tabBar, animated: true)
    }
    
    private func addTab() {
        let flow = CardsFlowCoordinator(tabBar: tabBarViewController ?? UITabBarController(), output: self)
        flow.start()
    }
}

extension TabBarFlowCoordinator: TabBarModuleOutput {
    
    func moduleWantsToAddTab(_ module: TabBarModuleInput) {
        addTab()
    }
}

extension TabBarFlowCoordinator: FlowCoordinatorProtocol {
    
    func start() {
        showTabBarModule()
    }
    
    func finish() {
        // unused
    }
}

extension TabBarFlowCoordinator: CardsFlowCoordinatorOutput {}
